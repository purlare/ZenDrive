using System;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Word = Microsoft.Office.Interop.Word;

namespace WpfApp3
{
    public partial class TestDrive : Page
    {
        private ZenDriveEntities dbContext;
        private Button BtnFilterByName;
        private Button BtnFilterByAvailability;
        private Button BtnSortByDate;

        public TestDrive()
        {
            InitializeComponent();
            dbContext = new ZenDriveEntities();
            LoadData();
            BtnAdd.Click += BtnAdd_Click;

            BtnFilterByName = this.FindName("BtnFilterByName") as Button;
            BtnFilterByAvailability = this.FindName("BtnFilterByAvailability") as Button;
            BtnSortByDate = this.FindName("BtnSortByDate") as Button;

            AvailabilityComboBox.SelectionChanged += AvailabilityComboBox_SelectionChanged;
            TxtSearchName.TextChanged += TxtSearchName_TextChanged;
            StartDatePicker.SelectedDateChanged += DatePicker_SelectedDateChanged;
            EndDatePicker.SelectedDateChanged += DatePicker_SelectedDateChanged;
        }

        private void AvailabilityComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void TxtSearchName_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void DatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void ApplyFilters()
        {
            try
            {
                if (dbContext != null)
                {
                    var filteredWorks = dbContext.Заявки_на_тест_драйв
                        .Include(z => z.Электромобили);

                    if (StartDatePicker.SelectedDate != null && EndDatePicker.SelectedDate != null)
                    {
                        DateTime startDate = StartDatePicker.SelectedDate.Value.Date;
                        DateTime endDate = EndDatePicker.SelectedDate.Value.Date.AddDays(1).AddSeconds(-1);
                        filteredWorks = filteredWorks.Where(z => z.дата_заявки >= startDate && z.дата_заявки <= endDate);
                    }

                    if (!string.IsNullOrWhiteSpace(TxtSearchName.Text) && TxtSearchName.Text != "Поиск")
                    {
                        string searchName = TxtSearchName.Text.Trim();
                        filteredWorks = filteredWorks.Where(z => z.имя.Contains(searchName) || z.Электромобили.Название.Contains(searchName));
                    }

                    if (AvailabilityComboBox.SelectedItem != null && AvailabilityComboBox.SelectedIndex != 0)
                    {
                        string availability = (AvailabilityComboBox.SelectedItem as ComboBoxItem).Content.ToString();
                        filteredWorks = filteredWorks.Where(z => z.Электромобили.Наличие == availability);
                    }

                    Filters.ItemsSource = filteredWorks.ToList();
                    UpdateTotalRecordsCount();
                }
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }

        private void LoadData()
        {
            try
            {
                var allWorks = dbContext.Заявки_на_тест_драйв
                    .Include(z => z.Электромобили)
                    .ToList();

                Filters.ItemsSource = allWorks;
                UpdateTotalRecordsCount();
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }

        private void UpdateTotalRecordsCount()
        {
            if (Filters != null && Filters.Items != null)
            {
                TotalRecordsTextBlock.Text = $"Всего записей: {Filters.Items.Count}";
            }
        }

        private void HandleException(Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
            MessageBox.Show($"Exception: {ex.Message}");
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Filters.SelectedItem != null && Filters.SelectedItem is Заявки_на_тест_драйв selectedTestDrive)
                {
                    Add addPage = new Add(selectedTestDrive);
                    NavigationService.Navigate(addPage);
                }
                else
                {
                    MessageBox.Show("Выберите запись для редактирования.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Add addPage = new Add();
            NavigationService.Navigate(addPage);
        }

        private void BtnExportToWord_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Word.Application wordApp = new Word.Application();
                wordApp.Visible = true;

                Word.Document doc = wordApp.Documents.Add();

                foreach (var item in Filters.Items)
                {
                    if (item is Заявки_на_тест_драйв testDrive)
                    {
                        Word.Paragraph para = doc.Paragraphs.Add();
                        para.Range.Text = $"Номер заявки: {testDrive.Код_заявки}, Название электромобиля: {testDrive.Электромобили?.Название}, Имя клиента: {testDrive.имя}, Email: {testDrive.e_mail}, Телефон: {testDrive.телефон}, Дата заявки: {testDrive.дата_заявки.ToString("dd.MM.yyyy")}, Наличие машины: {testDrive.Электромобили?.Наличие}";
                        para.Range.InsertParagraphAfter();
                    }
                }

                doc.Close();
                wordApp.Quit();
                System.Runtime.InteropServices.Marshal.ReleaseComObject(doc);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wordApp);
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Filters.SelectedItem != null && Filters.SelectedItem is Заявки_на_тест_драйв selectedTestDrive)
                {
                    MessageBoxResult result = MessageBox.Show("Вы уверены, что хотите удалить эту запись?", "Подтверждение удаления", MessageBoxButton.YesNo, MessageBoxImage.Question);

                    if (result == MessageBoxResult.Yes)
                    {
                        dbContext.Заявки_на_тест_драйв.Remove(selectedTestDrive);
                        dbContext.SaveChanges();
                        LoadData();
                    }
                }
                else
                {
                    MessageBox.Show("Выберите запись для удаления.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }

        private void TxtSearchName_GotFocus(object sender, RoutedEventArgs e)
        {
            if (TxtSearchName.Text == "Поиск")
            {
                TxtSearchName.Text = "";
                TxtSearchName.Foreground = Brushes.White;
            }
        }
        private void Filters_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        private void BtnResetFilters_Click(object sender, RoutedEventArgs e)
        {
            StartDatePicker.SelectedDate = null;
            EndDatePicker.SelectedDate = null;
            TxtSearchName.Text = "Поиск";
            TxtSearchName.Foreground = Brushes.White;
            AvailabilityComboBox.SelectedIndex = 0; 
            LoadData(); 
        }

        private void TxtSearchName_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TxtSearchName.Text))
            {
                TxtSearchName.Text = "Поиск";
                TxtSearchName.Foreground = Brushes.White;
            }
        }
    }
}
