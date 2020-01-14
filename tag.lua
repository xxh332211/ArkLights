require("util")
tag = {"新手", "资深干员", "高级资深干员", "远程位", "近战位",
       "先锋干员", "狙击干员", "医疗干员", "术师干员",
       "近卫干员", "重装干员", "辅助干员", "特种干员", "治疗",
       "支援", "输出", "群攻", "减速", "生存", "防护", "削弱",
       "位移", "控场", "爆发", "召唤", "快速复活", "费用回复",
       "支援机械"}
-- tagw = table.concat(tag)
tagw = "位先减出击削助医卫发召员唤回场复存师干弱快战手护控援支攻新术机械治活深爆特狙生用疗种移程级群装费资辅输近远速重锋防高"
-- https://www.taptap.com/topic/6542004
tag4 = [[
  资深干员：5星
  高级资深干员：6星
  近战位+治疗：古米（4星）、临光（5星）
  近战位+支援：杜宾（4星）、凛冬（5星）
  近战位+群攻：艾丝黛尔（4星）、幽灵鲨（5星）
  近战位+减速：霜叶（4星）、食铁兽（5星）
  近战位+控场：德克萨斯（5星）、红（5星）
   -
  远程位+生存：杰西卡（4星）
  远程位+支援：白面鸮（5星）、华法琳（5星）
  远程位+控场：梅尔（5星）
   -
  输出+防护：雷蛇（5星）、火神（5星）
  输出+重装：雷蛇（5星）、火神（5星）
  输出+辅助：真理（5星）
  输出+特种：狮蝎（5星）、崖心（5星）
  输出+支援：杜宾（4星）
  输出+削弱：夜烟（4星）、流星（4星）
  输出+减速：霜叶（4星）、真理（5星）
  输出+位移：崖心（5星）
  输出+治疗：夜魔（5星）
   -
  防护+特种：砾（4星）
  防护+治疗：古米（4星）、临光（5星）
  防护+位移：可颂（5星）
  防护+输出：雷蛇（5星）、火神（5星）
  防护+生存：火神（5星）
  -
  生存+远程：杰西卡（4星）
  生存+狙击：杰西卡（4星）
  生存+群攻：艾丝黛尔（4星）、幽灵鲨（5星）
  生存+特种：狮蝎（5星）
   -
  治疗+重装：古米（4星）、临光（5星）
  治疗+近战：古米（4星）、临光（5星）
  治疗+防护：古米（4星）、临光（5星）
  治疗+支援：白面鸮（5星）、华法琳（5星）
  治疗+术师：夜魔（5星）
  治疗+输出：夜魔（5星）
  治疗+减速：夜魔（5星）
   -
  支援：杜宾（4星）、白面鸮（5星）、华法琳（5星）、凛冬（5星）
  支援+先锋：凛冬（5星）
  支援+费用回复：凛冬（5星）
  支援+近卫：杜宾（4星）
  支援+医疗：白面鸮（5星）、华法琳（5星）
  支援+治疗：白面鸮（5星）、华法琳（5星）
  支援+近战：杜宾（4星）、凛冬（5星）
  支援+远程：白面鸮（5星）、华法琳（5星）
  支援+输出：杜宾（4星）
   -
  快速复活：砾（4星）、红（5星）
  快速复活+控场：红（5星）
  快速复活+防护：砾（4星）
   -
  群攻+近卫：艾丝黛尔（4星）、幽灵鲨（5星）
  群攻+近战：艾丝黛尔（4星）、幽灵鲨（5星）
  群攻+生存：艾丝黛尔（4星）、幽灵鲨（5星）
  群攻+削弱：陨星（5星）
  群攻+减速：白雪（4星）
   -
  召唤：梅尔（5星）
   -
  削弱：夜烟（4星）、流星（4星）、初雪（5星）、陨星（5星）
  削弱+狙击：流星（4星）、陨星（5星）
  削弱+术师：夜烟（4星）
  削弱+辅助：初雪（5星）
  削弱+输出：夜烟（4星）、流星（4星）
  削弱+群攻：陨星（5星）
   -
  减速+狙击：白雪（4星）
  减速+近卫：霜叶（4星）
  减速+术师：夜魔（5星）
  减速+特种：食铁兽（5星）
  减速+近战：霜叶（4星）、食铁兽（5星）
  减速+输出：霜叶（4星）、真理（5星）
  减速+群攻：白雪（4星）
  减速+治疗：夜魔（5星）
  减速+位移：食铁兽（5星）
   -
  控场：德克萨斯（5星）、红（5星）、梅尔（5星）
  控场+先锋：德克萨斯（5星）
  控场+费用回复：德克萨斯（5星）
  控场+特种：红（5星）
  控场+辅助：梅尔（5星）
  控场+近战：德克萨斯（5星）、红（5星）
  控场+远程：梅尔（5星）
  控场+快速复活：红（5星）
   -
  位移：暗索（4星）、阿消（4星）、崖心（5星）、食铁兽（5星）、可颂（5星）
  位移+重装：可颂（5星）
  位移+特种：暗索（4星）、阿消（4星）、崖心（5星）、食铁兽（5星）
  位移+输出：崖心（5星）
  位移+防护：可颂（5星）
  位移+减速：食铁兽（5星）
   -
  爆发：守林人（5星）
   -
  狙击+削弱：流星（4星）、陨星（5星）
  狙击+减速：白雪（4星）
  狙击+爆发：守林人（5星）
  狙击+生存：杰西卡（4星）
   -
  术师+削弱：夜烟（4星）
  术师+治疗：夜魔（5星）
  术师+减速：夜魔（5星）
   -
  先锋+支援：凛冬（5星）
  费用回复+支援：凛冬（5星）
  先锋+控场：德克萨斯（5星）
  费用回复+控场：德克萨斯（5星）
   -
  近卫+减速：霜叶（4星）
  近卫+支援：杜宾（4星）
  近卫+群攻：艾丝黛尔（4星）、幽灵鲨（5星）
   -
  重装+治疗：古米（4星）、临光（5星）
  重装+位移：可颂（5星）
  重装+输出：雷蛇（5星）、火神（5星）
  重装+生存：火神（5星）
   -
  医疗+支援：白面鸮（5星）、华法琳（5星）
   -
  辅助+削弱：初雪（5星）
  辅助+输出：真理（5星）
  辅助+控场：梅尔（5星）
   -
  特种：砾（4星）、暗索（4星）、阿消（4星）、红（5星）、狮蝎（5星）、崖心（5星）、食铁兽（5星）
  特种+输出：狮蝎（5星）、崖心（5星）
  特种+防护：砾（4星）
  特种+生存：狮蝎（5星）
  特种+减速：食铁兽（5星）
  特种+控场：红（5星）
  特种+位移：暗索（4星）、阿消（4星）、崖心（5星）、食铁兽（5星）
]]
tagk = {}
tagv = {}
for k, v in tag4:gmatch('([^\r\n%s]+)：([^\r\n%s]+)') do
  local t = {}
  for i in k:gmatch("[^%+]+") do
    i = table.find(tag, function(x) return x:startsWith(i) end)
    if not i then log('tag map error', k) end
    insert(t, tag[i])
  end
  insert(tagk, t)
  insert(tagv, v)
end
-- for k, v in pairs(tagk) do log(v) end
