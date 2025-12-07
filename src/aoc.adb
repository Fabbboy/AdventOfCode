with Ada.Command_Line;
with Ada.Text_IO;

with Utility;
with Days.Controller;

procedure Aoc is
   use Ada.Command_Line;
   use Ada.Text_IO;

   use Utility;
   use Days.Controller;

   Arg1 : constant String := Argument (1);
   Day  : Integer;
   DN   : Day_Number;
begin
   if Argument_Count < 1 then
      Put_Line ("Usage: aoc <day>");
      return;
   end if;

   if not parse_int (Arg1, Day) then
      Put_Line ("Invalid day: " & Arg1);
      return;
   end if;

   if Day in Day_Number then
      DN := Day_Number (Day);
      Run (DN);
   else
      Put_Line ("Day " & Integer'Image (Day) & " is out of range (1-25).");
   end if;
end Aoc;
