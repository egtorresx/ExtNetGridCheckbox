using Ext.Net;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridCheckbox
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                storePersonas.DataSource = Datos();
                storePersonas.DataBind();               
            }            
        }

        private List<Persona> Datos()
        { 
            var listaPersonas = new List<Persona>();
            Enumerable.Range(1, 10).ToList().ForEach(x => 
                listaPersonas.Add(new Persona{
                    ID = x,
                    Nombre = string.Format("Persona {0}", x)
                })
            );

            return listaPersonas;
        }

        [DirectMethod]
        public void GuardarRegistrosMarcados(string registros)
        {
            JsonSerializerSettings conf = new JsonSerializerSettings();
            conf.MissingMemberHandling = MissingMemberHandling.Ignore;

            var registrosComoListaCSharp = JsonConvert.DeserializeObject<List<Persona>>(registros);

            //registrosComoListaCSharp en esta variable tipo lista
            //estan todos los registros marcados y con los valores marcados
            //en las columnas
        }
    }

    public class Persona
    {
        public int ID { get; set; }
        public string Nombre { get; set; }

        public bool Guardar { get; set; }
        public bool Guardar2 { get; set; }
    }
}