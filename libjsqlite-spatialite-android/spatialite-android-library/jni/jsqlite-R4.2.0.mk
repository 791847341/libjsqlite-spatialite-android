include $(CLEAR_VARS)
LOCAL_MODULE    := jsqlite
LOCAL_CFLAGS	:= \
	-D__ANDROID__ \
	-DHAVE_SQLITE2=0 \
	-DHAVE_SQLITE3=1 \
	-DHAVE_SPATIALITE41=1 \
	-DHAVE_RASTERLITE2=1 \
	-DHAVE_SQLITE3_MALLOC=1 \
	-DHAVE_SQLITE3_OPEN_V2=1 \
	-DHAVE_SQLITE3_PREPARE_V2=1 \
	-DHAVE_SQLITE3_PREPARE16_V2=1 \
	-DHAVE_SQLITE3_CLEAR_BINDINGS=1 \
	-DHAVE_SQLITE3_BIND_PARAMETER_COUNT=1 \
	-DHAVE_SQLITE3_BIND_PARAMETER_NAME=1 \
	-DHAVE_SQLITE3_BIND_PARAMETER_INDEX=1 \
	-DHAVE_SQLITE3_BIND_ZEROBLOB=1 \
	-DHAVE_SQLITE3_RESULT_ZEROBLOB=1 \
	-DHAVE_SQLITE3_INCRBLOBIO=1 \
	-DHAVE_SQLITE3_SHARED_CACHE=1 \
	-DHAVE_SQLITE_SET_AUTHORIZER=1 \
	-DHAVE_SQLITE3_BACKUPAPI=1 \
	-DHAVE_SQLITE3_PROFILE=1 \
	-DHAVE_SQLITE3_STATUS=1 \
	-DHAVE_SQLITE3_DB_STATUS=1 \
	-DHAVE_SQLITE3_STMT_STATUS=1 \
	-DHAVE_SQLITE3_LOAD_EXTENSION=1 \
	-DCANT_PASS_VALIST_AS_CHARPTR=1
	# spatialite 4.1.1 needs zlib with advanced geos
LOCAL_LDLIBS	:= -fuse-ld=gold -llog -lz 
LOCAL_C_INCLUDES := \
	$(SQLITE_PATH)/ \
	$(JSQLITE_PATH)/native/
LOCAL_SRC_FILES := \
	$(JSQLITE_PATH)/native/sqlite_jni.c
LOCAL_STATIC_LIBRARIES := sqlite spatialite iconv proj geos lzma libgeotiff
include $(BUILD_SHARED_LIBRARY)
