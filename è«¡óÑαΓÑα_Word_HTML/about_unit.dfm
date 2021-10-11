object about_Form: Tabout_Form
  Left = 413
  Top = 140
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 282
  ClientWidth = 543
  Color = clMenuBar
  TransparentColor = True
  TransparentColorValue = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Shape2: TShape
    Left = 10
    Top = 247
    Width = 527
    Height = 30
    Cursor = crHandPoint
    Brush.Color = clGray
    Shape = stRoundRect
    OnMouseDown = Shape2MouseDown
  end
  object Label1: TLabel
    Left = 246
    Top = 246
    Width = 88
    Height = 25
    Cursor = crHandPoint
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    OnClick = Label1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 521
    Height = 233
    Alignment = taCenter
    BevelEdges = [beBottom]
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      '          HTML - WORD '#1082#1086#1085#1074#1077#1088#1090#1077#1088' v1.0'
      ''
      #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085#1072' '#1076#1083#1103' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' '
      #1079#1072#1088#1072#1085#1077#1077' '#1086#1090#1092#1086#1088#1084#1072#1090#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1090#1077#1082#1089#1090#1072' '#1074' '#1092#1086#1088#1084#1072#1090#1077' '
      '*doc ('#1076#1086#1082#1091#1084#1077#1085#1090' Word) '#1074' HTML '#1089#1087#1088#1072#1074#1082#1091
      ''
      #1040#1074#1090#1086#1088#1099': '#1064#1077#1089#1090#1086#1087#1072#1083#1086#1074' '#1040#1083#1077#1082#1089#1077#1081', '#1064#1077#1089#1090#1086#1087#1072#1083#1086#1074' '#1048#1083#1100#1103', '
      'e-mail: ACGCompany@yandex.ru'
      #1042#1089#1077' '#1087#1088#1072#1074#1072' '#1079#1072#1097#1080#1097#1077#1085#1099'. '
      #1041#1086#1083#1077#1077' '#1087#1086#1076#1088#1086#1073#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
      #1074' '#1092#1072#1081#1083#1077' '#1089#1087#1088#1072#1074#1082#1080' WordToHtmlHelp.exe')
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 1
    Left = 400
    Top = 16
  end
end
