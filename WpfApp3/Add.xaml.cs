using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Data.Entity;
using System.Windows.Input;

namespace WpfApp3
{
    public partial class Add : Page
    {
        private Заявки_на_тест_драйв selectedTestDrive;
        private ZenDriveEntities dbContext;

        public Add(Заявки_на_тест_драйв testDrive = null)
        {
            InitializeComponent();
            dbContext = new ZenDriveEntities();

            selectedTestDrive = testDrive;

            LoadCarBrands();

            if (selectedTestDrive != null)
            {
                FillFormFields();
            }
        }

        private void LoadCarBrands()
        {
            try
            {
                var carBrands = dbContext.Электромобили.Select(e => e.Название).Distinct().ToList();
                CmbBrand.ItemsSource = carBrands;
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }

        private void BtnAddRecord_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (CmbBrand.SelectedItem == null)
                {
                    MessageBox.Show("Выберите бренд электромобиля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(TxtName.Text) || string.IsNullOrWhiteSpace(TxtEmail.Text) ||
                    string.IsNullOrWhiteSpace(TxtPhone.Text) || DateRequest.SelectedDate == null)
                {
                    MessageBox.Show("Все поля должны быть заполнены.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (!IsPhoneNumberValid(TxtPhone.Text))
                {
                    MessageBox.Show("Введите корректный номер телефона.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                string selectedBrand = CmbBrand.SelectedItem?.ToString();

                if (selectedTestDrive == null)
                {
                    Заявки_на_тест_драйв newTestDriveRequest = new Заявки_на_тест_драйв
                    {
                        имя = TxtName.Text,
                        e_mail = TxtEmail.Text,
                        телефон = TxtPhone.Text,
                        дата_заявки = DateRequest.SelectedDate ?? DateTime.Now,
                        Код_электромобиля = dbContext.Электромобили
                            .Where(car => car.Название == selectedBrand)
                            .Select(car => car.Код_электромобиля)
                            .FirstOrDefault()
                    };

                    dbContext.Заявки_на_тест_драйв.Add(newTestDriveRequest);
                }
                else
                {

                    if (dbContext.Entry(selectedTestDrive).State == EntityState.Detached)
                    {
                        var existingEntity = dbContext.Заявки_на_тест_драйв.Find(selectedTestDrive.Код_заявки);
                        if (existingEntity != null)
                        {
                            dbContext.Entry(existingEntity).CurrentValues.SetValues(selectedTestDrive);
                            selectedTestDrive = existingEntity;
                        }
                        else
                        {
                            dbContext.Заявки_на_тест_драйв.Attach(selectedTestDrive);
                        }
                    }

                    selectedTestDrive.имя = TxtName.Text;
                    selectedTestDrive.e_mail = TxtEmail.Text;
                    selectedTestDrive.телефон = TxtPhone.Text;
                    selectedTestDrive.дата_заявки = DateRequest.SelectedDate ?? DateTime.Now;
                    selectedTestDrive.Код_электромобиля = dbContext.Электромобили
                        .Where(car => car.Название == selectedBrand)
                        .Select(car => car.Код_электромобиля)
                        .FirstOrDefault();
                }

                dbContext.SaveChanges();
                NavigationService.Navigate(new TestDrive());
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }
        private void TxtPhone_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

            if (!char.IsDigit(e.Text, 0))
            {
                e.Handled = true; 
            }
        }
        private bool IsPhoneNumberValid(string phoneNumber)
        {
            return phoneNumber.All(char.IsDigit);
        }

        private void HandleException(Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
            MessageBox.Show($"Exception: {ex.Message}");
        }
        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void FillFormFields()
        {
            CmbBrand.SelectedItem = selectedTestDrive.Электромобили?.Название;
            TxtName.Text = selectedTestDrive.имя;
            TxtEmail.Text = selectedTestDrive.e_mail;
            TxtPhone.Text = selectedTestDrive.телефон;
            DateRequest.SelectedDate = selectedTestDrive.дата_заявки;
        }
    }
}
