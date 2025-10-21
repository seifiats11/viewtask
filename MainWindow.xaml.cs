using Microsoft.EntityFrameworkCore;
using System;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using veiwtask._1.models;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace veiwtask._1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static string name;
        veiwtaskcontext _context = new veiwtaskcontext();


        public MainWindow()
        {
            InitializeComponent();
            txtUsername.Focus();
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {


            var employee = (from s in _context.User where txtUsername.Text == s.Name && txtPassword.Password == s.Password && s.Role == "Employee" select s).FirstOrDefault();
            if (employee != null)
            {
                name=employee.Name;
                Employee employee1 = new Employee();
                employee1.Show();
                this.Close();
            }
            else
            {
                txtMessage.Text = "incorrect password or userName";
            }

            var manager1 = (from s in _context.User where txtUsername.Text == s.Name && txtPassword.Password == s.Password && s.Role == "Manager" select s).FirstOrDefault();
            if (manager1 != null)
            {
                maneger manager = new maneger();
                manager.Show();
                this.Close();
            }
            else
            {
                txtMessage.Text = "incorrect password or userName";
            }



        }
    }
}