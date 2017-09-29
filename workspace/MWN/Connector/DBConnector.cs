using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using MySql.Data.MySqlClient;
using System.Configuration;

namespace MWN.Connector
{
    public class DBConnector
    {
        public static MySqlConnection getConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connectionString);
            return conn;
        }
    }
}