using System;
using System.Web.Security;
using System.Web;

namespace Salek_Portfolio
{
    public partial class Login : System.Web.UI.Page
    {
        private const string ADMIN_USER = "admin";
        private const string ADMIN_PASS = "admin123";

        protected void Page_Init(object sender, EventArgs e)
        {
            // No caching of this page (prevents back-button showing filled fields)
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));

            // Strongly discourage browser auto-fill
            txtUser.Attributes["autocomplete"] = "off";
            txtUser.Attributes["autocapitalize"] = "none";
            txtUser.Attributes["autocorrect"] = "off";

            // 'new-password' is respected by most browsers for passwords
            txtPass.Attributes["autocomplete"] = "new-password";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            if (string.Equals(txtUser.Text.Trim(), ADMIN_USER, StringComparison.OrdinalIgnoreCase)
                && txtPass.Text == ADMIN_PASS)
            {
                // Session cookie only (not persistent)
                FormsAuthentication.RedirectFromLoginPage(ADMIN_USER, false);
            }
            else
            {
                lblLoginError.Text = "Invalid username or password.";
            }
        }
    }
}
