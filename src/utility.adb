package body Utility is

   function parse_int (S : String; Result : out Integer) return Boolean is

      Val   : Integer := 0;
      Neg   : Boolean := False;
      Start : Integer := S'First;

      Radix : constant Integer := 10;

      Zero_Char : constant Character := '0';
      Nine_Char : constant Character := '9';
      Zero_Int  : constant Integer := Integer'Pos (Character'Pos (Zero_Char));
   begin

      if S'Length = 0 then
         return False;
      end if;

      if S (Start) = '-' then
         Neg := True;
         Start := Start + 1;
      elsif S (Start) = '+' then
         Start := Start + 1;
      end if;


      if Start > S'Last then
         return False;
      end if;

      for I in Start .. S'Last loop
         if S (I) not in Zero_Char .. Nine_Char then
            return False;
         end if;

         Val := Val * Radix + (Integer'Pos (Character'Pos (S (I))) - Zero_Int);
      end loop;

      if Neg then
         Val := -Val;
      end if;

      Result := Val;
      return True;

   end parse_int;
end Utility;
