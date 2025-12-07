package Utility is
   function parse_int (S : String; Result : out Integer) return Boolean;
   function read_file (Path : String) return String;
end Utility;
