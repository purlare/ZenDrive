using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Threading;

namespace WpfApp3
{
    public partial class Contact : Page
    {
        public Contact()
        {
            InitializeComponent();
        }
        private void ShowOnMapButton_Click(object sender, RoutedEventArgs e)
        {
            string address = "г. Орехово-Зуево, ул. Ленина, 55";

            string mapUrl = $"https://yandex.ru/maps/?text={Uri.EscapeDataString(address)}";
            Process.Start(new ProcessStartInfo(mapUrl) { UseShellExecute = true });
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {

        }
    }
}
