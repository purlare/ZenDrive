using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace WpfApp3
{
    public partial class TestDriveDialog : Window
    {
        private ZenDriveEntities dbContext;

        public TestDriveDialog()
        {
            InitializeComponent();
            dbContext = new ZenDriveEntities();
            LoadCarBrands();
        }
        private void LoadCarBrands()
        {
            try
            {
                var carBrands = dbContext.Электромобили.Select(e => e.Название).Distinct().ToList();
                CarComboBox.ItemsSource = carBrands;
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }

        private void SaveTestDrive_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (CarComboBox.SelectedItem == null)
                {
                    MessageBox.Show("Выберите бренд электромобиля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(NameTextBox.Text) || string.IsNullOrWhiteSpace(EmailTextBox.Text) ||
                    string.IsNullOrWhiteSpace(PhoneTextBox.Text) || DateDatePicker.SelectedDate == null)
                {
                    MessageBox.Show("Все поля должны быть заполнены.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (!IsPhoneNumberValid(PhoneTextBox.Text))
                {
                    MessageBox.Show("Введите корректный номер телефона.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                string selectedBrand = CarComboBox.SelectedItem?.ToString();

                Заявки_на_тест_драйв newTestDriveRequest = new Заявки_на_тест_драйв
                {
                    имя = NameTextBox.Text,
                    e_mail = EmailTextBox.Text,
                    телефон = PhoneTextBox.Text,
                    дата_заявки = DateDatePicker.SelectedDate ?? DateTime.Now,
                    Код_электромобиля = dbContext.Электромобили
                        .Where(car => car.Название == selectedBrand)
                        .Select(car => car.Код_электромобиля)
                        .FirstOrDefault()
                };

                dbContext.Заявки_на_тест_драйв.Add(newTestDriveRequest);
                dbContext.SaveChanges();

                MessageBox.Show("Заявка на тест драйв сохранена!", "Успешно отправлено", MessageBoxButton.OK, MessageBoxImage.Information);
                Close();
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }

        private void HandleException(Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
            MessageBox.Show($"Exception: {ex.Message}");
        }

        private bool IsPhoneNumberValid(string phoneNumber)
        {
            return phoneNumber.All(char.IsDigit);
        }
    }
}