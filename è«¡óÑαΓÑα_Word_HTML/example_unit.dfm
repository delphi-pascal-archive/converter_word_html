object example_Form: Texample_Form
  Left = 496
  Top = 200
  Width = 583
  Height = 357
  Caption = #1055#1088#1080#1084#1077#1088' '#1089#1090#1088#1072#1085#1080#1094#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 169
    Width = 575
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 24
    Width = 575
    Height = 121
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C0000006E3B0000810C00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object example_Memo: TMemo
    Left = 0
    Top = 172
    Width = 575
    Height = 123
    Align = alBottom
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 24
    Align = alTop
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 0
    Top = 145
    Width = 575
    Height = 24
    Align = alBottom
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' HTML '#1082#1086#1076' '#1089#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1085#1085#1086#1081' '#1089#1090#1088#1072#1085#1080#1094#1099
    TabOrder = 3
  end
  object Panel3: TPanel
    Left = 0
    Top = 295
    Width = 575
    Height = 24
    Cursor = crHandPoint
    Align = alBottom
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Panel3Click
  end
end
