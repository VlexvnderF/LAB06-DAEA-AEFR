using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidad;
using Datos.SqlHelper;

namespace Negocio
{
    public class BProduct
    {
        DProduct datos = new DProduct();

        public List<Product> Listar(string name)
        {

            
            var products = datos.Listar(name);
            /*
            var result = Productes.Where(x => x.Description == description
            || string.IsNullOrEmpty(description)
            ).ToList();
            */
            return products;

        }

        
        public void Insertar(Product Product)
        {
            try
            {
                //var Productes=datos.Listar();                
                //var max= Productes.Select(x=>x.IdProduct).Max();
                //Product.IdProduct = max+1;

                datos.Insertar(Product);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        public void Actualizar(Product producto)
        {
            try
            {
                datos.Actualizar(producto);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void Eliminar(Product producto)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>();
                SqlParameter param1;

                    param1 = new SqlParameter();
                    param1.ParameterName = "@idProducto";
                    param1.SqlDbType = SqlDbType.Int;
                    param1.Value = producto.idProducto;

                    parameters.Add(param1);
             

                SqlHelper.ExecuteNonQuery(connectionString, "DeleteProduct", CommandTyper.StoredProcedure, parameters.ToArray());
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

    }
}
