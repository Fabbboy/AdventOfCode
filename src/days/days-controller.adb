with Ada.Text_IO;
with Ada.Directories;

with Utility;
with Days.Day1;

package body Days.Controller is
   use Ada.Text_IO;
   use Ada.Directories;

   use Utility;
   use Days.Day1;

   Assets : constant String := "assets/";

   procedure Run (Day : Day_Number) is
   begin
      if not Exists (Assets) then
         Put_Line ("Assets directory not found: " & Assets);
         return;
      end if;

      case Day is
         when 1      =>
            declare
               Solver : Day1_Challenge := (null record);

               Data   : constant String := "day1.txt";
               Source : constant String := Assets & Data;
               Input  : constant String := read_file (Source);
            begin
               if not Exists (Source) then
                  Put_Line ("Input file not found: " & Source);
                  return;
               end if;


               Solver.Solve (Input);
            end;

         when others =>
            Put_Line
              ("Day " & Integer'Image (Day) & " is not yet implemented.");
            null;
      end case;
   end Run;

end Days.Controller;
