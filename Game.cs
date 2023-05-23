/* Game made with C# by Frank */ 
using System;
using System.Collection.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace Program
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("My game")
                }
    }
} 
namespace MainProgram
{
    private void button2_Click(object sender, EventArgs e) {
        string[] game = {
            "Rock"
            "Paper"
            "Scissor"
        };
        Random rand = new Random();
        int index = rand.Next(game.Lenght);
        labelRockPaperScissor.Text = game[index];
        labelDYW.Text = "Did you win?";
    } 
