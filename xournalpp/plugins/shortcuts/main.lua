-- api documentation
-- https://xournalpp.github.io/guide/plugins/plugins/#functions
-- https://github.com/xournalpp/xournalpp/blob/1002c131e1d7a1cb1243d955c611979b7faec488/src/enums/generated/ActionType.generated.cpp

function initUi()

  -- not working due to <shift> numbers not working
  app.registerUi({["menu"] = "Fine stroke", ["callback"] = "fine", ["accelerator"] = "<shift>1"});
  app.registerUi({["menu"] = "Medium stroke", ["callback"] = "medium", ["accelerator"] = "<shift>2"});
  app.registerUi({["menu"] = "Thick stroke", ["callback"] = "thick", ["accelerator"] = "<shift>3"});
  app.registerUi({["menu"] = "Arrow", ["callback"] = "arrow", ["accelerator"] = "<shift>4"}); 

  -- undo & redo, both not working due to function not working
  app.registerUi({["menu"] = "Undo", ["callback"] = "undo", ["accelerator"] = "z"});
  app.registerUi({["menu"] = "Redo", ["callback"] = "redo", ["accelerator"] = "r"});


  -- pen tools 
  app.registerUi({["menu"] = "Default tool", ["callback"] = "default", ["accelerator"] = "<shift>f"}); 
  app.registerUi({["menu"] = "Line", ["callback"] = "line", ["accelerator"] = "<shift>l"}); 
  app.registerUi({["menu"] = "Rectangle", ["callback"] = "rectangle", ["accelerator"] = "<shift>r"}); 

  -- other tools
  app.registerUi({["menu"] = "Hand", ["callback"] = "hand", ["accelerator"] = "<shift>h"}); 
  app.registerUi({["menu"] = "Vertical space", ["callback"] = "vertical", ["accelerator"] = "v"}); 
  app.registerUi({["menu"] = "Snap to grid", ["callback"] = "gridsnap", ["accelerator"] = "<shift>V"}); 

  -- zoom, J and K are already mapped
  app.registerUi({["menu"] = "Zoom in", ["callback"] = "zoomIn", ["accelerator"] = "<shift>q"});
  app.registerUi({["menu"] = "Zoom out", ["callback"] = "zoomOut", ["accelerator"] = "<shift>x"});
  app.registerUi({["menu"] = "Zoom to 100", ["callback"] = "zoom100", ["accelerator"] = "<shift>z"}); 

  -- turn pages
  app.registerUi({["menu"] = "Next", ["callback"] = "last", ["accelerator"] = "<shift>G"});

  -- saving
  app.registerUi({["menu"] = "Save", ["callback"] = "save", ["accelerator"] = "t"}); 
  app.registerUi({["menu"] = "Save pdf", ["callback"] = "exportPdf", ["accelerator"] = "<shift>t"}); 

  -- insert pages
  app.registerUi({["menu"] = "Insert before", ["callback"] = "insertBefore", ["accelerator"] = "<shift>n"}); 
  app.registerUi({["menu"] = "Insert after", ["callback"] = "insertAfter", ["accelerator"] = "n"}); 


  -- copy & paste (duplicate does not exist)
  app.registerUi({["menu"] = "Copy", ["callback"] = "copy", ["accelerator"] = "x"});
  app.registerUi({["menu"] = "Paste", ["callback"] = "paste", ["accelerator"] = "q"});

  -- fill "f"
  app.registerUi({["menu"] = "Fill on/off", ["callback"] = "fill", ["accelerator"] = "f"});

  -- selection
  app.registerUi({["menu"] = "Select region", ["callback"] = "select", ["accelerator"] = "s"});
  app.registerUi({["menu"] = "Select rectangle", ["callback"] = "selectRect", ["accelerator"] = "<shift>s"});

  -- pen "m"
  app.registerUi({["menu"] = "Pen Tool", ["callback"] = "pen", ["accelerator"] = "m"});
  app.registerUi({["menu"] = "Cycle through line style", ["callback"] = "linestyle", ["accelerator"] = "<shift>m"});

  -- eraser "b"
  app.registerUi({["menu"] = "Eraser Tool", ["callback"] = "eraser", ["accelerator"] = "b"});
  app.registerUi({["menu"] = "Cycle through eraser type", ["callback"] = "eraserSwitch", ["accelerator"] = "<shift>b"}); 

  -- scroll "hjkl"
  app.registerUi({["menu"] = "Scroll Up", ["callback"] = "scrollUp", ["accelerator"] = "k"}); 
  app.registerUi({["menu"] = "Scroll Down", ["callback"] = "scrollDown", ["accelerator"] = "j"}); 
end

local currentFill = false
local currentGridsnap = false


local colorList = {
  {"black", 0x000000},
  {"red", 0xff0000},
  {"lightblue", 0x00c0ff},
  {"green", 0x008000}
  --{"white", 0xffffff},
  --{"lightgreen", 0x00ff00},
  --{"blue", 0x3333cc},
  --{"gray", 0x808080},
  --{"magenta", 0xff00ff},
  --{"orange", 0xff8000},
  --{"yellow", 0xffff00},
}

local currentColor = 1 -- start with black color

local linestyleList = {"PLAIN", "DOT"}
local currentLinestyle = 1

local toolList = {"PEN", "ERASER", "HILIGHTER", "SELECTION"}
local currentTool = 1

local eraserList = {"STANDARD", "DELETE_STROKE"} -- I don't use WHITEOUT
local currentEraser = 1


--===================================--
--============ functions ============--
--===================================--

--============ 1st, not working ones ===--
function undo()
  app.uiAction({["action"] = "ACTION_TOOL_UNDO"})
  print("ACTION_TOOL_UNDO: selected")
end

function redo()
  app.uiAction({["action"] = "ACTION_TOOL_REDO"})
  print("ACTION_TOOL_REDO: selected")
end


--============ 2nd, working ones =======--
function fine()
  app.uiAction({["action"] = "ACTION_SIZE_FINE"})
  print("ACTION_SIZE_FINE: selected")
end

function medium()
  app.uiAction({["action"] = "ACTION_SIZE_MEDIUM"})
  print("ACTION_SIZE_MEDIUM: selected")
end

function thick()
  app.uiAction({["action"] = "ACTION_SIZE_THICK"})
  print("ACTION_SIZE_THICK: selected")
end

function arrow()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_ARROW"})
  print("ACTION_TOOL_DRAW_ARROW: selected")
end

function line()
  app.uiAction({["action"] = "ACTION_RULER"})
  print("ACTION_TOOL_DRAW_RULER: selected")
end

function rectangle()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT"})
  print("ACTION_TOOL_DRAW_RECT: selected")
end

function hand()
  app.uiAction({["action"] = "ACTION_TOOL_HAND"})
  print("ACTION_TOOL_HAND: selected")
end

function vertical()
  app.uiAction({["action"] = "ACTION_TOOL_VERTICAL_SPACE"})
  print("ACTION_TOOL_VERTICAL_SPACE: selected")
end

function zoomIn()
  app.uiAction({["action"] = "ACTION_ZOOM_IN"})
  print("ACTION_ZOOM_IN: selected")
end

function zoomOut()
  app.uiAction({["action"] = "ACTION_ZOOM_OUT"})
  print("ACTION_ZOOM_OUT: selected")
end

function zoom100()
  app.uiAction({["action"] = "ACTION_ZOOM_100"})
  print("ACTION_ZOOM_100: selected")
end

function save()
  app.uiAction({["action"] = "ACTION_SAVE"})
  print("ACTION_SAVE: selected")
end

function exportPdf()
  app.uiAction({["action"] = "ACTION_EXPORT_AS_PDF"})
  print("ACTION_EXPORT_AS_PDF: selected")
end

function insertBefore()
  app.uiAction({["action"] = "ACTION_NEW_PAGE_BEFORE"})
  print("ACTION_NEW_PAGE_BEFORE: selected")
end

function insertAfter()
  app.uiAction({["action"] = "ACTION_NEW_PAGE_AFTER"})
  print("ACTION_NEW_PAGE_AFTER: selected")
end

function last()
  app.uiAction({["action"] = "ACTION_GOTO_LAST"})
  print("ACTION_GOTO_LAST: selected")
end

function default()
  app.uiAction({["action"] = "ACTION_TOOL_DEFAULT"})
  print("ACTION_TOOL_DEFAULT: selected")
end

function pen()
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
  print("ACTION_TOOL_PEN: selected")
end

function eraser()
  app.uiAction({["action"] = "ACTION_TOOL_ERASER"})  
  print("Eraser: Standard mode")
end

function gridsnap()
  currentGridsnap = not currentGridsnap
  app.uiAction({["action"]="ACTION_GRID_SNAPPING"})
  print("ACTION_GRID_SNAPPING: toggled")
end

function fill()
  currentFill = not currentFill
  app.uiAction({["action"]="ACTION_TOOL_FILL", ["enabled"] = currentFill})
  print("ACTION_TOOL_FILL enabled: " .. tostring(currentFill))
end

function copy()
  app.uiAction({["action"] = "ACTION_COPY"})
  print("ACTION_TOOL_COPY: selected")
end

function paste()
  app.uiAction({["action"] = "ACTION_PASTE"})
  print("ACTION_TOOL_PASTE: selected")
end

function scrollUp()
  app.scroll({["direction"] = -2}) -- Scroll up
  print("Scrolling Up")
end

function scrollDown()
  app.scroll({["direction"] = 2}) -- Scroll down
  print("Scrolling Down")
end

function linestyle()
  currentLinestyle = currentLinestyle % #linestyleList + 1
  app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_" .. linestyleList[currentLinestyle]})
  print("ACTION_TOOL_LINE_STYLE_" .. linestyleList[currentLinestyle])
end

function select()
  app.uiAction({["action"] = "ACTION_TOOL_SELECT_REGION"})
  print("ACTION_TOOL_SELECT_REGION: selected")
end

function selectRect()
  app.uiAction({["action"] = "ACTION_TOOL_SELECT_RECT"})
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

function scroll()
  currentToggle = currentToggle % #toggleList + 1
  app.uiAction({["action"] = "ACTION_TOOL_" .. toggleList[currentToggle]})
  print("ACTION_TOOL_" .. toolList[currentTool])
end
