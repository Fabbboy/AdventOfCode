with Ada.Text_IO;
with Days.Day1;

package body Days.Controller is
   use Ada.Text_IO;

   procedure Run (Day : Day_Number) is
   begin
      case Day is
         when 1      =>
            Days.Day1.Solve;

         when others =>
            Put_Line
              ("Day " & Integer'Image (Day) & " is not yet implemented.");
            null;
      end case;
   end Run;

end Days.Controller;
