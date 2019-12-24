var
 sa,sh : string;
 si : array [1..128] of longint;
 a : array [1..128,1..128] of longint;
 b,c : array [1..128] of longint;
 n,lens,pos : longint;
 i,j,r : longint;

begin
 write('Masukkan Pesan = ');
 readln(sa);

 write('Masukkan ukuran Matriks Penyandian = ');
 readln(n);

 writeln('Masukkan isi Matriks Penyandian = ');
 for i := 1 to n do
  begin
   for j := 1 to n do
    begin
     read(a[i,j]);
    end;
  end;

 //del_space
 lens := length(sa);
 for i := 1 to lens do
  begin
   if (sa[i] = ' ') then
    delete(sa,i,1);
  end;
 lens := length(sa);

 //conv_to_int
 for i := 1 to lens do
  begin
   si[i] := ord(sa[i]) -  64;
  end;

 //if_len_odd
 if (lens mod n <> 0) then
  begin
   repeat
    begin
     sa := sa + sa[lens];
     si[lens+1] := si[lens];
     inc(lens);
    end;
   until (lens mod n = 0);
  end;

 //calculation
 pos := 0;
 for r := 1 to (lens div n) do
  begin
   for i := 1 to n do
    begin //vector_column
     inc(pos);
     b[i] := si[pos];
     c[i] := 0;
    end;
   for i := 1 to n do
    begin
     for j := 1 to n do
      begin //matrix_operation
       c[i] := c[i] + (a[i,j] * b[j]);
      end;
     if (c[i] >= 26) then
      begin //if_>Z
       c[i] := c[i] mod 26;
      end;
     //init_result
     sh := sh + chr(c[i] + 64);
    end;
  end;

 writeln('Teks Pesan Awal = ',sa);
 writeln('Teks Hasil Sandi = ',sh);
end.
