with Days.Controller;

package Days.Day1 is
   use Days.Controller;

   type Day1_Challenge is new Challenge with null record;

   overriding
   procedure Solve (C : in out Day1_Challenge; Input : String);
end Days.Day1;
