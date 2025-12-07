package Days.Controller is
   subtype Day_Number is Integer range 1 .. 25;

   type Challenge is interface;
   procedure Solve (C : in out Challenge; Input : String) is abstract;

   procedure Run (Day : Day_Number);
end Days.Controller;
