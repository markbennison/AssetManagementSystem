using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AssetManagementSystem.Startup))]
namespace AssetManagementSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
