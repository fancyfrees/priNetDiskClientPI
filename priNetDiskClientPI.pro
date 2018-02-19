TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    prinetdiskclientpi.cpp

HEADERS += \
    prinetdiskclientpi.h

unix:!macx: LIBS += -L$$PWD/../../CppLibrary/build-NWmanagerClient-Desktop_Qt_5_9_2_GCC_64bit-Debug/ -lNWmanagerClient

INCLUDEPATH += $$PWD/../../CppLibrary/NWmanagerClient
DEPENDPATH += $$PWD/../../CppLibrary/NWmanagerClient

unix:!macx: LIBS += -L$$PWD/../../CppLibrary/build-NWmanager-Desktop_Qt_5_9_2_GCC_64bit-Debug/ -lNWmanager

INCLUDEPATH += $$PWD/../../CppLibrary/NWmanager
DEPENDPATH += $$PWD/../../CppLibrary/NWmanager
