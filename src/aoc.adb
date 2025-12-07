with Ada.Command_Line;
with Ada.Text_IO;
with Utility;

procedure Aoc is
   use Ada.Command_Line;
   use Ada.Text_IO;
   use Utility;

   Arg1 : constant String := Argument (1);
   Day  : Integer;
begin
   if Argument_Count < 1 then
      Put_Line ("Usage: aoc <day>");
      return;
   end if;

   if not parse_int (Arg1, Day) then
      Put_Line ("Invalid day: " & Arg1);
      return;
   end if;

   Put_Line ("Running Advent of Code for Day" & Integer'Image (Day));
end Aoc;
