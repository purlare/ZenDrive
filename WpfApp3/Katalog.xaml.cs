using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace WpfApp3
{
    public partial class Katalog : Page
    {
        private bool ascendingOrder = true;

        public Katalog()
        {
            InitializeComponent();
            LoadCarData();
        }

        private void LoadCarData()
        {
            using (var context = new ZenDriveEntities())
            {
                var cars = context.Электромобили.Include("Характеристики").Include("Кузов").ToList();

                cars = ascendingOrder ? cars.OrderBy(c => c.Цена).ToList() : cars.OrderByDescending(c => c.Цена).ToList();

                var availabilityFilter = ((ComboBoxItem)AvailabilityFilterComboBox.SelectedItem)?.Content.ToString();

                if (availabilityFilter == "Да")
                    cars = cars.Where(c => c.Наличие == "Да").ToList();
                else if (availabilityFilter == "Под заказ")
                    cars = cars.Where(c => c.Наличие == "Под заказ").ToList();

                var searchQuery = SearchTextBox.Text.Trim();

                if (!string.IsNullOrEmpty(searchQuery))
                    cars = cars.Where(c => c.Название.ToLower().Contains(searchQuery.ToLower())).ToList();

                if (ContentStackPanel != null)
                {
                    ContentStackPanel.Children.Clear();

                    foreach (var car in cars)
                    {
                        var characteristics = car.Характеристики.FirstOrDefault();
                        var body = car.Кузов.FirstOrDefault();

                        var grid = new Grid();
                        grid.ColumnDefinitions.Add(new ColumnDefinition() { Width = new GridLength(1, GridUnitType.Star) });
                        grid.ColumnDefinitions.Add(new ColumnDefinition() { Width = new GridLength(1, GridUnitType.Star) });
                        grid.ColumnDefinitions.Add(new ColumnDefinition() { Width = new GridLength(2, GridUnitType.Star) });

                        var image1 = new Image();
                        image1.Source = new BitmapImage(new Uri(car.Фото1, UriKind.RelativeOrAbsolute));
                        image1.Margin = new Thickness(0, 0, 5, 5);
                        image1.Height = 450;
                        image1.VerticalAlignment = VerticalAlignment.Top;

                        var image2 = new Image();
                        image2.Source = new BitmapImage(new Uri(car.Фото2, UriKind.RelativeOrAbsolute));
                        image2.Margin = new Thickness(20, 0, 5, 5);
                        image2.Height = 450;
                        image2.VerticalAlignment = VerticalAlignment.Top;

                        var textBlock = new TextBlock();
                        textBlock.FontSize = 18;
                        textBlock.Margin = new Thickness(80, 0, 0, 10);
                        textBlock.VerticalAlignment = VerticalAlignment.Top;

                        AddTextToBlock(textBlock, "Наличие в автосалоне: ", car.Наличие);
                        AddTextToBlock(textBlock, "Цена: ", $"{car.Цена} р.");
                        AddTextToBlock(textBlock, "Тип двигателя: ", characteristics?.тип_двигателя);
                        AddTextToBlock(textBlock, "Мощность электромотора: ", $"{characteristics?.мощность_электромотора} лс");
                        AddTextToBlock(textBlock, "Запас хода: ", $"{characteristics?.запас_хода} км");
                        AddTextToBlock(textBlock, "Емкость батареи: ", $"{characteristics?.емкость_батареи} кВт");
                        AddTextToBlock(textBlock, "Привод: ", characteristics?.привод);
                        AddTextToBlock(textBlock, "Длина: ", $"{body?.длина} мм");
                        AddTextToBlock(textBlock, "Ширина: ", $"{body?.ширина} мм");
                        AddTextToBlock(textBlock, "Высота: ", $"{body?.высота} мм");
                        AddTextToBlock(textBlock, "Колесная база: ", $"{body?.колесная_база} мм");
                        AddTextToBlock(textBlock, "Шины: ", body?.шины);

                        var titleTextBlock = new TextBlock();
                        titleTextBlock.Text = car.Название;
                        titleTextBlock.FontSize = 30;
                        titleTextBlock.FontWeight = FontWeights.Bold;
                        titleTextBlock.HorizontalAlignment = HorizontalAlignment.Center; 

                        Grid.SetColumn(titleTextBlock, 0);
                        Grid.SetRow(titleTextBlock, 0);
                        Grid.SetColumnSpan(titleTextBlock, 2); 
                        titleTextBlock.Margin = new Thickness(0, -70, 0, 0); 

                        grid.Children.Add(titleTextBlock);

                        textBlock.FontSize = 18;
                        textBlock.Margin = new Thickness(80, 0, 0, 10);
                        textBlock.VerticalAlignment = VerticalAlignment.Top;

                        Grid.SetColumn(image1, 0);
                        Grid.SetColumn(image2, 1);
                        Grid.SetColumn(textBlock, 2);

                        grid.Children.Add(image1);
                        grid.Children.Add(image2);
                        grid.Children.Add(textBlock);

                        grid.Margin = new Thickness(80, 0, 0, 10);

                        ContentStackPanel.Children.Add(grid);
                        var gSeparator = new Border();
                        gSeparator.Background = Brushes.Gray;
                        gSeparator.Height = 1;
                        gSeparator.Margin = new Thickness(0, -80, 0, 80); 
                        ContentStackPanel.Children.Add(gSeparator);
                    }
                    if (cars.Count == 0)
                    {
                        NoResultsTextBlock.Visibility = Visibility.Visible;
                    }
                    else
                    {
                        NoResultsTextBlock.Visibility = Visibility.Collapsed;
                    }
                }
            }
        }

        private void AddTextToBlock(TextBlock textBlock, string title, string value)
        {
            textBlock.Inlines.Add(new Run(title) { FontWeight = FontWeights.Bold });
            textBlock.Inlines.Add(new Run($"{value}\n"));
        }

        private void ScheduleTestDrive_Click(object sender, RoutedEventArgs e)
        {
            TestDriveDialog dialog = new TestDriveDialog();
            dialog.ShowDialog();
        }

        private void SortAscendingButton_Click(object sender, RoutedEventArgs e)
        {
            ascendingOrder = true;
            LoadCarData();
        }

        private void SortDescendingButton_Click(object sender, RoutedEventArgs e)
        {
            ascendingOrder = false;
            LoadCarData();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            LoadCarData();
        }
        private void SearchTextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            SearchLabel.Visibility = Visibility.Collapsed;
        }

        private void AvailabilityFilterComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadCarData();
        }
    }
}