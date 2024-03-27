using System.Windows;
using System.Windows.Controls;

namespace WpfApp3
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.NavigationService.Navigate(new Katalog());
        }

        private void Katalog_Click(object sender, RoutedEventArgs e) => MainFrame.Content = new Katalog();
        private void Guarantees_Click(object sender, RoutedEventArgs e) => MainFrame.Content = new Guarantees();
        private void Contacts_Click(object sender, RoutedEventArgs e) => MainFrame.Content = new Contact();
        private void Button_Click(object sender, RoutedEventArgs e) => MainFrame.Content = new Administrator();
    }
}
