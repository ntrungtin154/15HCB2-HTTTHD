﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web.Http;
using Autofac;
using Autofac.Integration.WebApi;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(CardProcessingApi.Web.Startup))]

namespace CardProcessingApi.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //var builder = new ContainerBuilder();

            //// STANDARD WEB API SETUP:

            //// Get your HttpConfiguration. In OWIN, you'll create one
            //// rather than using GlobalConfiguration.
            //var config = new HttpConfiguration();

            //// Register your Web API controllers.
            //builder.RegisterApiControllers(Assembly.GetExecutingAssembly());

            //// Run other optional steps, like registering filters,
            //// per-controller-type services, etc., then set the dependency resolver
            //// to be Autofac.
            //var container = builder.Build();
            //config.DependencyResolver = new AutofacWebApiDependencyResolver(container);

            //// OWIN WEB API SETUP:

            //// Register the Autofac middleware FIRST, then the Autofac Web API middleware,
            //// and finally the standard Web API middleware.
            //app.UseAutofacMiddleware(container);
            //app.UseAutofacWebApi(config);
            //app.UseWebApi(config);

            ConfigureAuth(app);
        }
    }
}
