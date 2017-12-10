<?xml version="1.0" encoding="UTF-8"?>
<project name="8bit_ALU" board="Mojo V3" language="Lucid">
  <files>
    <src>alu.luc</src>
    <src>shifter_8bit.luc</src>
    <src>adder_8bit.luc</src>
    <src>oper_seg_display.luc</src>
    <src>comparator_8bit.luc</src>
    <src>absolute_8bit.luc</src>
    <src>multiplier_8bit.luc</src>
    <src>boolean_8bit.luc</src>
    <src>player_setter.luc</src>
    <src>auto_test.luc</src>
    <src>multi_seven_seg.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>player_getter.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <ucf>custom.ucf</ucf>
    <component>decoder.luc</component>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
