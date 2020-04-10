unit pasyamltestcase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry, libpasyaml, pasyaml, fgl;

type

  { TYamlTestCase }

  TYamlTestCase = class(TTestCase)
  published
    procedure TestMapParse;
  end;

implementation

{ TYamlTestCase }

procedure TYamlTestCase.TestMapParse;
const
  config : string = 'title   : Finex 2011'                        + sLineBreak +
                    'img_url : /finex/html/img'                   + sLineBreak +
                    'css_url : /finex/html/style'                 + sLineBreak +
                    'js_url  : /finex/html/js';
var
  YamlFile : TYamlFile;
begin
  YamlFile := TYamlFile.Create;
  YamlFile.Parse(config);

  AssertTrue(YamlFile.Value['title'].AsString = 'Finex 2011');
  AssertTrue(YamlFile.Value['img_url'].AsString = '/finex/html/img');
  AssertTrue(YamlFile.Value['css_url'].AsString = '/finex/html/style');
  AssertTrue(YamlFile.Value['js_url'].AsString = '/finex/html/js');

  FreeAndNil(YamlFile);
end;

initialization
  RegisterTest(TYamlTestCase);
end.

