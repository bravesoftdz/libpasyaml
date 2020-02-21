unit pasyamltestcase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry, libpasyaml;

type

  { TLibYamlTestCase }

  TLibYamlTestCase = class(TTestCase)
  published
    procedure TestCreate;
  end;

implementation

{ TLibYamlTestCase }

procedure TLibYamlTestCase.TestCreate;
var
  emitter : yaml_emitter_t;
  event : yaml_event_t;
  buffer : string[64];
  Result : Integer;
begin
  yaml_emitter_initialize(@emitter);
  Result := yaml_stream_start_event_initialize(@event, YAML_UTF8_ENCODING);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  Result := yaml_document_start_event_initialize(@event, nil, nil, nil, 0);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);
  Result := yaml_mapping_start_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_MAP_TAG)), 1, YAML_ANY_MAPPING_STYLE);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);
  Result := yaml_scalar_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_STR_TAG)), pyaml_char_t(PChar('fruit')),
    Length('fruit'), 1, 0, YAML_PLAIN_SCALAR_STYLE);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  Result := yaml_sequence_start_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_SEQ_TAG)), 1, YAML_ANY_SEQUENCE_STYLE);

  {--- first item ---}
  Result := yaml_mapping_start_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_MAP_TAG)), 1, YAML_ANY_MAPPING_STYLE);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  Result := yaml_scalar_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_STR_TAG)), pyaml_char_t(PChar('name')),
    Length('name'), 1, 0, YAML_PLAIN_SCALAR_STYLE);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  Result := yaml_scalar_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_STR_TAG)), pyaml_char_t(PChar('apple')),
    Length('apple'), 1, 0, YAML_PLAIN_SCALAR_STYLE);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  Result := yaml_scalar_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_STR_TAG)), pyaml_char_t(PChar('color')),
    Length('color'), 1, 0, YAML_PLAIN_SCALAR_STYLE);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  Result := yaml_scalar_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_STR_TAG)), pyaml_char_t(PChar('red')),
    Length('red'), 1, 0, YAML_PLAIN_SCALAR_STYLE);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  Result := yaml_scalar_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_STR_TAG)), pyaml_char_t(PChar('count')),
    Length('count'), 1, 0, YAML_PLAIN_SCALAR_STYLE);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  buffer := Format('%d', [12]);
  Result := yaml_scalar_event_initialize(@event, nil,
    pyaml_char_t(PChar(YAML_INT_TAG)), pyaml_char_t(@buffer[0]),
    Length(buffer), 1, 0, YAML_PLAIN_SCALAR_STYLE);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  Result := yaml_mapping_end_event_initialize(@event);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);
  {--- end first item ---}

  Result := yaml_sequence_end_event_initialize(@event);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);
  Result := yaml_mapping_end_event_initialize(@event);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);
  Result := yaml_document_end_event_initialize(@event, 0);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  Result := yaml_stream_end_event_initialize(@event);
  AssertTrue(Format('Failed to emit event %d: %s', [event.event_type,
    emitter.problem]), Result <> 0);

  yaml_emitter_delete(@emitter);
end;

initialization

  RegisterTest(TLibYamlTestCase);
end.
