using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PRPO_Manage.Startup))]
namespace PRPO_Manage
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
