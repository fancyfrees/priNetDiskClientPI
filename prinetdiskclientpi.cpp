#include "prinetdiskclientpi.h"

#include "../NWmanagerClient/nwmanagerclient.h"
#include "prinetdisk.h"

#include <iostream>
#include <sstream>

priNetDiskClientPI::priNetDiskClientPI(const std::string &clientName)
	:myName(clientName),serverSignal(false)
{

}

void priNetDiskClientPI::startServer()
{
	/**
	 * TUDO :
	 * add a setTimer
	 * 监听时间超时，自动重新连接服务器
	 * */
	priNetdisk  temp(this->localPort,512);
	temp.onInit();
	temp.doLoop();
}

void priNetDiskClientPI::startClient(const std::string &destIP, const unsigned short &destPort)
{
	initClient();
	NWmanagerClient toServer;
	toServer.dealMsg = std::bind(&priNetDiskClientPI::onMsgDeal ,this , std::placeholders::_1,std::placeholders::_2);
	if( toServer.doStart(destIP,destPort) == -1)
	{
		std::cout <<" connect refuse " <<std::endl;
		return ;
	}
	this->localPort = toServer.getLocalPort();
	toServer.setMsg("setName#"+myName);
	toServer.doWrite();
	while( !serverSignal)
		toServer.doRead();
}

void priNetDiskClientPI::onMsgDeal(const std::string &msgHead, const std::string &msgBody)
{
	if( dealMsgFunc.find(msgHead) == dealMsgFunc.end())	//对象消息处理函数未找到
	{
		return ;
	}
	this->dealMsgFunc[msgHead](msgBody);//调用消息处理函数
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


