using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Reflection;
using System.Configuration;
using MySql.Data.MySqlClient;

using MWN.Connector;

namespace MWN
{
    public class Tables
    {
        public static List<Bmi> getBmi(String username)
        {
            List<Bmi> bmi = new List<Bmi>();
            Bmi holder = null;
            string query = "SELECT bmiID, bmi, healthStatus, height, weight, optimalWeight, timeStamp FROM mwn.bmi WHERE username = @1 ORDER BY timeStamp desc";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", username));
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        holder = new Bmi();
                        holder.bmiID = reader["bmiID"].ToString();
                        holder.height = double.Parse(reader["height"].ToString());
                        holder.weight = double.Parse(reader["weight"].ToString());
                        holder.bmi = double.Parse(reader["bmi"].ToString());
                        holder.healthStatus = reader["healthStatus"].ToString();
                        holder.optimalWeight = reader["optimalWeight"].ToString();
                        holder.timeStamp = reader["timeStamp"].ToString();
                        bmi.Add(holder);
                    }
                }
            }
            return bmi;
        }
        public static List<Messages> getMessage(String username)
        {
            List<Messages> message = new List<Messages>();
            Messages holder = null;
            string query = "SELECT mailID,MessageTo,MessageFrom,MessageSubject,Message FROM mwn.message WHERE MessageTo = @2";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query, conn))
                {
                    command.Parameters.Add(new MySqlParameter("2", username));
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        holder = new Messages();
                        holder.mailID = reader["mailID"].ToString();
                        holder.MessageTo = reader["MessageTo"].ToString();
                        holder.MessageFrom = reader["MessageFrom"].ToString();
                        holder.MessageSubject = reader["MessageSubject"].ToString();
                        holder.Message = reader["Message"].ToString();
                        message.Add(holder);
                    }
                }
            }
            return message;
        }
        public static List<Conversation> getConversation(String username, String username2)
        {
            List<Conversation> conversation = new List<Conversation>();
            Conversation holder = null;
            string query = "SELECT timeStamp,MessageTo,MessageFrom,MessageSubject,Message FROM mwn.message WHERE MessageFrom = @1 OR MessageTo = @2 ORDER BY timeStamp desc";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", username));
                    command.Parameters.Add(new MySqlParameter("2", username2));
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        holder = new Conversation();
                        holder.timeStamp = reader["timeStamp"].ToString();
                        holder.MessageTo = reader["MessageTo"].ToString();
                        holder.MessageFrom = reader["MessageFrom"].ToString();
                        holder.MessageSubject = reader["MessageSubject"].ToString();
                        holder.Message = reader["Message"].ToString();
                        conversation.Add(holder);
                    }
                }
            }
            return conversation;
        }
        public class Bmi
        {
            public string bmiID { get; set; }
            public string username { get; set; }
            public double height { get; set; }
            public double weight { get; set; }
            public double bmi { get; set; }
            public string healthStatus { get; set; }
            public string optimalWeight { get; set; }
            public string timeStamp { get; set; }
        }

        public class Messages
        {
            public string mailID { get; set; }
            public string MessageTo { get; set; }
            public string MessageFrom { get; set; }
            public string MessageSubject { get; set; }
            public string Message { get; set; }
        }
        public class Conversation
        {
            public string timeStamp { get; set; }
            public string MessageTo { get; set; }
            public string MessageFrom { get; set; }
            public string MessageSubject { get; set; }
            public string Message { get; set; }
        }
    }
}