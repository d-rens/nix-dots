-- api documentation
-- https://xournalpp.github.io/guide/plugins/plugins/#functions

function initUi()

  --to be kept but modified 
  app.registerUi({["menu"] = "Cycle through colors", ["callback"] = "color", ["accelerator"] = "<Control><Shift>c"});
  app.registerUi({["menu"] = "Cycle through drawing type", ["callback"] = "drawingtype", ["accelerator"] = "t"});



  ------ own below ------
  -- copy & paste
  app.registerUi({["menu"] = "Copy", ["callback"] = "copy", ["accelerator"] = "x"});
  app.registerUi({["menu"] = "Paste", ["callback"] = "paste", ["accelerator"] = "q"});
  
  -- does not work, not an UI action
  -- app.registerUi({["menu"] = "Duplicate", ["callback"] = "duplicate", ["accelerator"] = "<Shift>x"});

  -- fill "f"
  app.registerUi({["menu"] = "Fill on/off", ["callback"] = "fill", ["accelerator"] = "f"});

  -- selection
  app.registerUi({["menu"] = "Select region", ["callback"] = "select", ["accelerator"] = "s"});
  app.registerUi({["menu"] = "Cycle through selection tools", ["callback"] = "selectTools", ["accelerator"] = "<Shift>s"});

  -- pen "m"
  app.registerUi({["menu"] = "Pen Tool", ["callback"] = "pen", ["accelerator"] = "m"});
  app.registerUi({["menu"] = "Cycle through line style", ["callback"] = "linestyle", ["accelerator"] = "<Shift>m"});

  -- eraser "b"
  app.registerUi({["menu"] = "Eraser Tool", ["callback"] = "eraser", ["accelerator"] = "b"});
  app.registerUi({["menu"] = "Cycle through eraser type", ["callback"] = "eraserSwitch", ["accelerator"] = "<Shift>b"}); 

  -- scroll "hjkl"
  app.registerUi({["menu"] = "Scroll Up", ["callback"] = "scrollUp", ["accelerator"] = "k"}); 
  app.registerUi({["menu"] = "Scroll Down", ["callback"] = "scrollDown", ["accelerator"] = "j"}); 

  -- zoom, not working
  app.registerUi({["menu"] = "Zoom In", ["callback"] = "zoomIn", ["accelerator"] = "<Shift>j"});
  --app.registerUi({["menu"] = "Zoom In", ["callback"] = "zoomIn", ["accelerator"] = "J"});
  app.registerUi({["menu"] = "Zoom Out", ["callback"] = "zoomOut", ["accelerator"] = "K"});
  --app.registerUi({["menu"] = "Zoom Out", ["callback"] = "zoomOut", ["accelerator"] = "<Shift>k"});
end


local currentFill = false
local currentRotsnap = false
local currentGridsnap = false

function pen()
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
  print("ACTION_TOOL_PEN: selected")
end

function eraser()
  app.uiAction({["action"] = "ACTION_TOOL_ERASER"})  
  print("Eraser: Standard mode")
end

------------- zooom, not working  -------------
-- Here one should use the UI actions but i don't know which one
function zoomIn()
  app.sidebarAction({["action"] = "ACTION_ZOOM_IN"})  -- Zoom in
  print("Zooming in")
end

-- Define the zoom out callback
function zoomOut()
  app.sidebarAction({["action"] = "ZOOM_OUT"})  -- Zoom in
  print("Zooming out")
end


-- function gridsnap()
  -- currentGridsnap = not currentGridsnap
  -- app.uiAction({["action"]="ACTION_GRID_SNAPPING"})
  -- print("ACTION_GRID_SNAPPING: toggled")
-- end
-- 
-- function rotsnap()
  -- currentRotsnap = not currentRotsnap
  -- app.uiAction({["action"]="ACTION_ROTATION_SNAPPING"})
  -- print("ACTION_ROTATION_SNAPPING: toggled")
-- end

function fill()
  currentFill = not currentFill
  app.uiAction({["action"]="ACTION_TOOL_FILL", ["enabled"] = currentFill})
  print("ACTION_TOOL_FILL enabled: " .. tostring(currentFill))
end

local colorList = {
  {"black", 0x000000},
  {"green", 0x008000},
  {"lightblue", 0x00c0ff},
  {"lightgreen", 0x00ff00},
  {"blue", 0x3333cc},
  {"gray", 0x808080},
  {"red", 0xff0000},
  {"magenta", 0xff00ff},
  {"orange", 0xff8000},
  {"yellow", 0xffff00},
  {"white", 0xffffff}
}
local currentColor = 1 -- start with black color

local linestyleList = {"PLAIN", "DOT"}
--local linestyleList = {"PLAIN", "DASH", "DASH_DOT", "DOT"}

local currentLinestyle = 1

local selectList = {"RECT", "REGION", "OBJECT"} -- don't use play selection tool
local currentSelect = 1

local toolList = {"PEN", "ERASER", "HILIGHTER", "SELECTION"}
local currentTool = 1

local eraserList = {"STANDARD", "DELETE_STROKE"} -- I don't use WHITEOUT
local currentEraser = 1

local drawingtypeList = {"TOOL_DRAW_RECT", "TOOL_DRAW_CIRCLE", "TOOL_DRAW_ARROW", "RULER", "TOOL_DRAW_SPLINE", "SHAPE_RECOGNIZER"} -- Don't include coordinate system and default tool
local currentDrawingtype = 1

local toggleList = {"PEN", "HAND"}
local currentToggle = 1


function copy()
  app.uiAction({["action"] = "ACTION_COPY"})
  print("ACTION_TOOL_COPY: selected")
end

function paste()
  app.uiAction({["action"] = "ACTION_PASTE"})
  print("ACTION_TOOL_PASTE: selected")
end

-- function duplicate()
	-- app.uiAction({["action"] = "ACTION_DUPLICATE"})
	-- print("ACTION_TOOL_DUPLICATE: selected")
-- end

function scrollUp()
  app.scroll({["direction"] = -2}) -- Scroll up
  print("Scrolling Up")
end

-- Callback function for scrolling down
function scrollDown()
  app.scroll({["direction"] = 2}) -- Scroll down
  print("Scrolling Down")
end


function color()
  currentColor = currentColor % #colorList + 1
  app.changeToolColor({["color"] = colorList[currentColor][2], ["selection"] = true})
  print("Color: " .. colorList[currentColor][1])
end

function linestyle()
  currentLinestyle = currentLinestyle % #linestyleList + 1
  app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_" .. linestyleList[currentLinestyle]})
  print("ACTION_TOOL_LINE_STYLE_" .. linestyleList[currentLinestyle])
end


---- SELECTION, "s"
function selectTools()
  currentSelect = currentSelect % #selectList + 1
  app.uiAction({["action"] = "ACTION_TOOL_SELECT_" .. selectList[currentSelect]})
  print("ACTION_TOOL_SELECT_" .. selectList[currentSelect])
end

function select()
  app.uiAction({["action"] = "ACTION_TOOL_SELECT_REGION"})
  print("ACTION_TOOL_SELECT_REGION: selected")
end


function tool()
  currentTool = currentTool % #toolList + 1
  if (toolList[currentTool] == "SELECTION") then
    app.uiAction({["action"] = "ACTION_TOOL_SELECT_" .. selectList[currentSelect]})
    print("ACTION_TOOL_SELECT_" .. selectList[currentSelect])
  else
    app.uiAction({["action"] = "ACTION_TOOL_" .. toolList[currentTool]})
    print("ACTION_TOOL_" .. toolList[currentTool])
  end
end

function eraserSwitch()
  currentEraser = currentEraser % #eraserList + 1
  app.uiAction({["action"] = "ACTION_TOOL_ERASER_" .. eraserList[currentEraser]})
  print("ACTION_TOOL_ERASER_" .. eraserList[currentEraser])
end

function drawingtype()
  currentDrawingtype = currentDrawingtype % #drawingtypeList + 1
  app.uiAction({["action"] = "ACTION_" .. drawingtypeList[currentDrawingtype]})
  print("ACTION_" .. drawingtypeList[currentDrawingtype])
end

function scroll()
  currentToggle = currentToggle % #toggleList + 1
  app.uiAction({["action"] = "ACTION_TOOL_" .. toggleList[currentToggle]})
  print("ACTION_TOOL_" .. toolList[currentTool])
end
