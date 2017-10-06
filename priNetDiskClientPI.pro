TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    prinetdiskclientpi.cpp

HEADERS += \
    prinetdiskclientpi.h


LIBS += -lpthread  -lboost_filesystem -lboost_system

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../build-NWmanagerClient-Desktop_Qt_5_6_1_GCC_64bit-Debug/release/ -lNWmanagerClient
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../build-NWmanagerClient-Desktop_Qt_5_6_1_GCC_64bit-Debug/debug/ -lNWmanagerClient
else:unix: LIBS += -L$$PWD/../build-NWmanagerClient-Desktop_Qt_5_6_1_GCC_64bit-Debug/ -lNWmanagerClient

INCLUDEPATH += $$PWD/../build-NWmanagerClient-Desktop_Qt_5_6_1_GCC_64bit-Debug
DEPENDPATH += $$PWD/../build-NWmanagerClient-Desktop_Qt_5_6_1_GCC_64bit-Debug

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../build-NWmanager-Desktop_Qt_5_6_1_GCC_64bit-Debug/release/ -lNWmanager
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../build-NWmanager-Desktop_Qt_5_6_1_GCC_64bit-Debug/debug/ -lNWmanager
else:unix: LIBS += -L$$PWD/../build-NWmanager-Desktop_Qt_5_6_1_GCC_64bit-Debug/ -lNWmanager

INCLUDEPATH += $$PWD/../build-NWmanager-Desktop_Qt_5_6_1_GCC_64bit-Debug
DEPENDPATH += $$PWD/../build-NWmanager-Desktop_Qt_5_6_1_GCC_64bit-Debug
