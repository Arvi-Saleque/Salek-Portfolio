using System;
using System.Configuration;
using System.Web.Security;

namespace Salek_Portfolio
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            var user = ConfigurationManager.AppSettings["AdminUser"] ?? string.Empty;
            var pass = ConfigurationManager.AppSettings["AdminPass"] ?? string.Empty;

            if (string.Equals(txtUser.Text.Trim(), user, StringComparison.OrdinalIgnoreCase)
                && txtPass.Text == pass)
            {
                // Set auth cookie and redirect to return URL or admin home
                FormsAuthentication.RedirectFromLoginPage(user, false);
            }
            else
            {
                lblLoginError.Text = "Invalid username or password.";
            }
        }
    }
}


