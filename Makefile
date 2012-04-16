#//////////////////////////////////////////////////////////////////////////////////
#//// GENERIC  maya plugin make file
#///////////////////////////////////////////////////

#////////
#/// version 1.0
#/// author : johnc
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

#
# Include platform specific build settings
#
include ./buildconfig

.SUFFIXES: .cpp .cc .o .so .c .bundle

OUTPUT = ./

PLUGIN = curveBrushTool.$(EXT)

COMPILE  = $(CC) -c $(CFLAGS) $(INCLUDES)

.cpp.o:
	$(COMPILE) $< -o $@

plugins: $(PLUGIN)

depend:
	makedepend $(INCLUDES) *.cc *.cpp

clean:
	-rm -f ./src/*.o  $(OUTPUT)*.so


##################
# Specific Rules #
##################

SOURCES = 	brushContextCommand.cpp\
		brushContext.cpp\
		brushTool.cpp\
		pluginMain.cpp

OBJS = $(SOURCES:.cpp=.o)

all: $(SOURCES) $(PLUGIN)

$(PLUGIN): $(OBJS)
	-rm -f $(OUTPUT)$@
	$(LD) -o $(OUTPUT)$@ $(OBJS) $(LIBS)






