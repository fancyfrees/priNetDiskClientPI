#include "prinetdiskclientpi.h"


#include "prinetdisk.h"

#include <iostream>
#include <sstream>

priNetDiskClientPI::priNetDiskClientPI(const std::string &clientName,const int&protoType)
	:priNetDiskClient(clientName)
{
	initClient();
}

void priNetDiskClientPI::startServer()
{
	/**
	 * TUDO :
	 * add a setTimer
	 * 监听时间超时，自动重新连接服务器
	 * */
	priNetdisk  temp(this->localPort,false);
	temp.onInit();
	temp.doLoop();
	this->serverSignal = false;	//服务器断开信号清空
}

void priNetDiskClientPI::initClient()
{
	dealMsgFunc.clear();
	dealMsgFunc["searchClient"] = std::bind(&priNetDiskClientPI::onSetOclientAddr,this,std::placeholders::_1);
}

void priNetDiskClientPI::onSetOclientAddr(const std::string &Oclient)
{
	std::cout << Oclient <<std::endl;
	OclientIP = Oclient.substr(0,Oclient.find(':'));
	std::istringstream in(Oclient.substr(Oclient.find(':')+1));
	in >> OclientPort;
	this->serverSignal = true;
}

void priNetDiskClientPI::waitForTer()
{
	if( !serverSignal )
		this->pNWman->doRead();
}
