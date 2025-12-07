with Ada.Text_IO;
with Utility;

package body Days.Day1 is
   use Ada.Text_IO;
   use Utility;

   procedure Solve (C : in out Day1_Challenge; Input : String) is
      Start, Stop : Positive := Input'First;

      Direction_Allowed : constant array (1 .. 2) of Character := ('R', 'L');
      Direction_Offset  : constant Integer := 1;
      Limit             : constant Integer := 100;

      Zeroes  : Integer := 0;
      Counter : Integer := 50;
      Mode    : Character;
   begin
      while Start <= Input'Last loop
         while (Stop <= Input'Last) and then (Input (Stop) /= ASCII.LF) loop
            Stop := Stop + 1;
         end loop;

         declare
            Val : Integer;

            CounterBk : constant Integer := Counter;
            Line      : constant String := Input (Start .. Stop - 1);
            Numbers   : constant String :=
              Line (Line'First + Direction_Offset .. Line'Last);
         begin
            if Line'Length = 0 then
               goto Next;
            end if;

            Mode := Line (Line'First);
            if (for all C of Direction_Allowed => C /= Mode) then
               Put_Line ("Invalid mode: " & Mode);
               return;
            end if;

            if not parse_int (Numbers, Val) then
               Put_Line ("Invalid number: " & Numbers);
               return;
            end if;

            if Mode = Direction_Allowed (1) then
               declare
                  Raw   : constant Integer := CounterBk + Val;
                  Cross : constant Integer := Raw / Limit;
               begin
                  Counter := Raw mod Limit;
                  Zeroes := Zeroes + Cross;
               end;

            else
               declare
                  Raw   : constant Integer := CounterBk - Val;
                  Cross : constant Integer := (-Raw + (Limit - 1)) / Limit;
               begin
                  Counter := ((Raw mod Limit) + Limit) mod Limit;
                  Zeroes := Zeroes + Cross;
               end;

            end if;

            if Counter = 0 then
               Zeroes := Zeroes + 1;
            end if;


            <<Next>>
         end;
         Start := Stop + 1;
         Stop := Start;
      end loop;

      Put_Line ("Final Counter: " & Integer'Image (Counter));
      Put_Line ("Number of Zeroes: " & Integer'Image (Zeroes));
   end Solve;

end Days.Day1;
