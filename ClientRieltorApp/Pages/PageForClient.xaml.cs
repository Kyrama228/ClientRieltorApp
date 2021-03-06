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

namespace ClientRieltorApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageForClient.xaml
    /// </summary>
    public partial class PageForClient : Page
    {
        public PageForClient()
        {
            InitializeComponent();
            ClientListView.ItemsSource = MainWindow.ent.Products.ToList();
        }

        private void GoBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new StartPage());
        }
    }
}
