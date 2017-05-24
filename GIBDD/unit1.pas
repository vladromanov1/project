unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, Grids, DBGrids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    MySQL55Connection1: TMySQL55Connection;
    MySQL55Connection2: TMySQL55Connection;
    MySQL55Connection3: TMySQL55Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SQLTransaction2: TSQLTransaction;
    SQLTransaction3: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MySQL55Connection1AfterConnect(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
   try
   MySQL55Connection1.Connected:=true;
 except
   ShowMessage('Подключение к БД: ОШИБКА!');
   exit;
 end;
   try
   SQLTransaction1.Active:=true;
 except
   ShowMessage('Транзакция: ОШИБКА!');
   exit;
 end;
end;

procedure TForm1.MySQL55Connection1AfterConnect(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
var a,b,c:string;
begin
  try
  SQLQuery1.Active:=false;
  SQLQuery1.ExecSQL;
  SQLQuery1.SQL.Clear;
  a:='SELECT * FROM tbl_pass_driver';
  SQLQuery1.SQL.Add(a);
  SQLQuery1.Open;
  except
    SQLQuery1.Close;
  end;
  ComboBox1.Text:= ''; ComboBox2.Text:= ''; ComboBox3.Text:= ''; ComboBox4.Text:= '';  ComboBox5.Text:= '';
  try
  SQLQuery2.Active:=false;
  SQLQuery2.ExecSQL;
  SQLQuery2.SQL.Clear;
  b:='SELECT * FROM tbl_pass_auto';
  SQLQuery2.SQL.Add(b);
  SQLQuery2.Open;
  except
    SQLQuery2.Close;
  end;
  try
  SQLQuery3.Active:=false;
  SQLQuery3.ExecSQL;
  SQLQuery3.SQL.Clear;
  c:='SELECT * FROM tbl_mark';
  SQLQuery3.SQL.Add(c);
  SQLQuery3.Open;
  except
    SQLQuery3.Close;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
    str_sql : string;
begin
  try
   SQLQuery1.Active := false;
   SQLQuery1.SQL.Clear;
   str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
   SQLQuery1.sql.add(str_sql);
   SQLQuery1.ExecSQL;
   SQLQuery1.SQL.Clear;
   SQLQuery1.sql.add('SELECT * FROM tbl_pass_driver;');
   SQLQuery1.Open;
  except
   ShowMessage('SQL-запрос: ОШИБКА!');
   exit;
 end;
end;

procedure TForm1.Button4Click(Sender: TObject);
 var
    str_sql : string;
begin
try
  SQLQuery2.Active := false;
  SQLQuery2.SQL.Clear;
  str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
  SQLQuery2.sql.add(str_sql);
  SQLQuery2.ExecSQL;
  SQLQuery2.SQL.Clear;
  SQLQuery2.sql.add('SELECT * FROM tbl_pass_auto;');
  SQLQuery2.Open;
 except
  ShowMessage('SQL-запрос: ОШИБКА!');
  exit;
end;
 end;

procedure TForm1.Button5Click(Sender: TObject);
  var
    str_sql : string;
begin
try
  SQLQuery3.Active := false;
  SQLQuery3.SQL.Clear;
  str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
  SQLQuery3.sql.add(str_sql);
  SQLQuery3.ExecSQL;
  SQLQuery3.SQL.Clear;
  SQLQuery3.sql.add('SELECT * FROM tbl_mark;');
  SQLQuery3.Open;
 except
  ShowMessage('SQL-запрос: ОШИБКА!');
  exit;
end;
end;


procedure TForm1.ComboBox1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b,c:string;
begin
  try
  SQLQuery1.Active:=false;
  SQLQuery1.ExecSQL;
  SQLQuery1.SQL.Clear;
  a:='SELECT * FROM tbl_pass_driver where  family_name = "'+ComboBox1.Text+'" and first_name= "'+ComboBox2.Text+'" and father_name= "'+ComboBox3.Text+'"';
  b:='SELECT * FROM tbl_pass_auto where  state_number = "'+ComboBox4.Text+'"';
  SQLQuery1.SQL.Add(a);
  SQLQuery1.Open;
  except
    SQLQuery1.Close;
  end;
  try
  SQLQuery2.Active:=false;
  SQLQuery2.ExecSQL;
  SQLQuery2.SQL.Clear;
  b:='SELECT * FROM tbl_pass_auto where  state_number = "'+ComboBox4.Text+'"';
  SQLQuery2.SQL.Add(b);
  SQLQuery2.Open;
  except
    SQLQuery2.Close;
  end;
  try
  SQLQuery3.Active:=false;
  SQLQuery3.ExecSQL;
  SQLQuery3.SQL.Clear;
  c:='SELECT * FROM tbl_mark where  factory_number = "'+ComboBox5.Text+'"';
  SQLQuery3.SQL.Add(c);
  SQLQuery3.Open;
  except
    SQLQuery3.Close;
  end;
end;

end.

