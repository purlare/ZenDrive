using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp3.Properties
{
    /// <summary>
    /// Логика взаимодействия для Section.xaml
    /// </summary>
    public partial class Section : Page
    {
        public Section()
        {
            InitializeComponent();
        }
        private void Guarantees_Click(object sender, RoutedEventArgs e)
        {
            Frame frame = new Frame();
            frame.Navigate(new Guarantees());
            Content = frame;
        }

        private void Articles_Click(object sender, RoutedEventArgs e)
        {
            Frame frame = new Frame();
            frame.Navigate(new Uri("Section.xaml", UriKind.Relative));
            Content = frame;
        }
        private void Contacts_Click(object sender, RoutedEventArgs e)
        {
            Frame frame = new Frame();
            frame.Navigate(new Uri("Contact.xaml", UriKind.Relative));
            Content = frame;
        }

    }
}
