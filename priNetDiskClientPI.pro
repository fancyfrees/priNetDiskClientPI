TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    prinetdiskclientpi.cpp

HEADERS += \
    prinetdiskclientpi.h


#unix:!macx: LIBS += -L$$PWD/../../CppLibrary/build-NWmanagerClient-Desktop_Qt_5_9_2_GCC_64bit-Debug/ -lNWmanagerClient

#INCLUDEPATH += $$PWD/../../CppLibrary/NWmanagerClient
#DEPENDPATH += $$PWD/../../CppLibrary/NWmanagerClient

#unix:!macx: LIBS += -L$$PWD/../../CppLibrary/build-NWmanager-Desktop_Qt_5_9_2_GCC_64bit-Debug/ -lNWmanager

#INCLUDEPATH += $$PWD/../../CppLibrary/NWmanager
#DEPENDPATH += $$PWD/../../CppLibrary/NWmanager

unix:!macx: LIBS += -L$$PWD/../../CppLibrary/build-NWmanagerUDT-Desktop_Qt_5_9_2_GCC_64bit-Debug/ -lNWmanagerUDT

INCLUDEPATH += $$PWD/../../CppLibrary/NWmanagerUDT
DEPENDPATH += $$PWD/../../CppLibrary/NWmanagerUDT

unix:!macx: LIBS += -L$$PWD/../../CppLibrary/build-NWmanagerUDTClient-Desktop_Qt_5_9_2_GCC_64bit-Debug/ -lNWmanagerUDTClient

INCLUDEPATH += $$PWD/../../CppLibrary/NWmanagerUDTClient
DEPENDPATH += $$PWD/../../CppLibrary/NWmanagerUDTClient

INCLUDEPATH += $$PWD/../../CppLibrary/udt


unix:!macx: LIBS += -L$$PWD/../../CppLibrary/udt/ -ludt -lpthread

INCLUDEPATH += $$PWD/../../CppLibrary/udt
DEPENDPATH += $$PWD/../../CppLibrary/udt

unix:!macx: LIBS += -L$$PWD/../../CppLibrary/build-Encrypt-Desktop_Qt_5_9_2_GCC_64bit-Debug/ -lEncrypt

INCLUDEPATH += $$PWD/../../CppLibrary/Encrypt
DEPENDPATH += $$PWD/../../CppLibrary/Encrypt
