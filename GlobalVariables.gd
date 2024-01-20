extends Node

var BlowOrSuck = false
var theTime
var ben = false

func retrieveTime(t):
	theTime=t

func sendTime():
	return theTime

func retrieveBen():
	return ben

func sendBen(bo):
	ben = bo

func getBlowOrSuck():
	return BlowOrSuck

func setBlowOrSuck(bos):
	BlowOrSuck=bos
