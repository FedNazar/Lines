unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  xTr, yTr, zStub: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if (Form1.Canvas.PenPos.x < 0) then xTr:=1;
  if (Form1.Canvas.PenPos.x > Form1.Width) then Form1.Canvas.MoveTo(0, Form1.Canvas.PenPos.y);
  if (Form1.Canvas.PenPos.y < 0) then yTr:=1;
  if (Form1.Canvas.PenPos.y > Form1.Height) then Form1.Canvas.MoveTo(Form1.Canvas.PenPos.x, 0);
  Form1.Canvas.LineTo(Form1.Canvas.PenPos.x+xTr, Form1.Canvas.PenPos.y+yTr);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Timer2.Interval:=Random(4000);
  xTr:=Random(2);
  yTr:=Random(2);
  if (xTr = 0) and (yTr = 0) then xTr:=1;
  zStub:=Random(100);
  if (zStub > 45) then
  begin
    zStub:=Random(101);
    if (zStub < 26) then
    begin
      xTr:=-1;
      yTr:=-1;
    end
    else if (zStub > 25) and (zStub < 51) then
    begin
      xTr:=1;
      yTr:=-1;
    end
    else if (zStub > 50) and (zStub < 100) then
    begin
      xTr:=-1;
      yTr:=1;
    end
  end;
  Form1.Canvas.Pen.Color:=RGBToColor(Random(256),Random(256),Random(256));
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  Form1.Canvas.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Form1.Canvas.AntialiasingMode:=amOn;
  Form1.Canvas.MoveTo(Random(Form1.Width), Random(Form1.Height));
  Timer2Timer(Timer2);
  Form1.Canvas.Pen.Width:=4;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  Form1.Close;
end;

end.

