using System.Windows;
using System.Windows.Input;

namespace TelerikWpfApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

//            dataGrid.AsTable<DataGridTableInformation>();
        }

        private void RadGridView_OnMouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var part = dataGrid.SelectedItem as Part;
            MessageBox.Show("Selected Part: " + part.PartId,"Selected Part");
        }
    }
}