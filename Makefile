BUILD_FOLDER = build
SOURCE_FOLDER = src
# Folders under 'SOURCE_FOLDER' to be copied directly
# ! It doesn't support nested folders
COPY_FOLDERS = deps img
# Sass compiler
# ! Beware that changing the compiler might break this script
# ! Modify the 'sass' task accordingly to your compiler usage
SASS_COMP = sassc
SASS_FLAGS =
SASS_FOLDER = $(SOURCE_FOLDER)/css
SASS_FILES := $(shell find $(SASS_FOLDER) -name '*.scss')

#---------------#
#  _T_A_S_K_S_  #
#               #
# · all         #
# · clean       #
# · rebuild     #
# · copy        #
# · sass        #
# · handlebars  #
#---------------#

#client: copy client/build/js/app.js client/build/css/app.css
.PHONY: clean rebuild all sass copy
### ALL
all: copy sass
#all: copy %.handlebars %.scss

### CLEAN
clean:
	##### Deleting the build...
	rm -rf $(BUILD_FOLDER)

### REBUILD
rebuild: clean all

### COPY
copy: $(COPY_FOLDERS)
$(COPY_FOLDERS):
	##### Copying assets...
	mkdir -p $(addprefix $(BUILD_FOLDER)/, $(COPY_FOLDERS))
	rsync -rupE $(SOURCE_FOLDER)/$@ $(BUILD_FOLDER)

### SASS
sass: $(SASS_FILES)
	##### Compiling Sass files...
	mkdir -p $(BUILD_FOLDER)/css
	@# Current call structure: command [flags] [INPUT] [OUTPUT]
	@# ! Depends on the compiler
	$(foreach file, $(SASS_FILES), \
	  $(SASS_COMP) $(SASS_FLAGS) $(file) \
		  $(addprefix $(BUILD_FOLDER)/css/, $(notdir $(basename $(file))).css);)
			@# Transforms 'origin/css/example.scss' into 'destination/css/example.css'

# # JavaScript concatenation with TypeScript
# tsfiles = $(shell find client/src/js -name  '*.ts')
# client/build/js/app.js: $(tsfiles)
# 	mkdir -p client/build/js
# 	tsc --sourceMap --out client/build/js/app.js client/src/js/app.ts
#
# # Directly copy files
# copy: $(COPYDIRS)
# $(COPYDIRS):
# 	mkdir -p client/build
# 	rsync -rupE client/src/$@ client/build
#
# .PHONY: client clean rebuild copy $(COPYDIRS)
