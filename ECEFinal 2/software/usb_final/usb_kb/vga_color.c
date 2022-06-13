/*
 * text_mode_vga_color.c
 * Minimal driver for text mode VGA support
 * This is for Week 2, with color support
 *
 *  Created on: Oct 25, 2021
 *      Author: zuofu
 */

//#include /*"C:/intelFPGA_lite/18.1/ECELab7/software/Lab72/text_mode_vga_color.h" // update when moving to home pc*/

#include <system.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <alt_types.h>
#include "vga_color.h"

void textVGAColorClr()
{
	for (int i = 0; i<(ROWS*COLUMNS) * 2; i++)
	{
		vga_ctrl->VRAM[i] = 0x00;//modified for test, replace with zero afterwards
	}
}

void textVGADrawColorText(char* str, int x, int y, alt_u8 background, alt_u8 foreground)
{
	int i = 0;
	while (str[i]!=0)
	{
		vga_ctrl->VRAM[(y*COLUMNS + x + i) * 2] = foreground << 4 | background;
		vga_ctrl->VRAM[(y*COLUMNS + x + i) * 2 + 1] = str[i];
		i++;
	}
}

void setColorPalette (alt_u8 color, alt_u8 red, alt_u8 green, alt_u8 blue)
{
	//fill in this function to set the color palette starting at offset 0x0000 2000 (from base)


	vga_ctrl->VRAM[0x9600*2 + 2*color] = (green << 4) | blue;
	vga_ctrl->VRAM[0x9600*2 + 2*color + 1] = red;


}


void textVGAColorScreenSaver()
{
	//This is the function you call for your week 2 demo
	char color_string[80];
    int fg, bg, x, y;
	textVGAColorClr();
	//initialize palette
	for (int i = 0; i < 16; i++)  // used later in 7.2
	{
		setColorPalette (i, colors[i].red, colors[i].green, colors[i].blue);
	}
	while (1)
	{
		fg = rand() % 16;
		bg = rand() % 16;
		printf("%d", fg);
		while (fg == bg)
		{
			fg = rand() % 16;
			bg = rand() % 16;
		}
		sprintf(color_string, "Drawing %s text with %s background", colors[fg].name, colors[bg].name);
		x = rand() % (80-strlen(color_string));
		y = rand() % 30;
		textVGADrawColorText (color_string, x, y, bg, fg);
		usleep (100000);
	}
}

void paletteTest()
{
	textVGAColorClr();
	textVGADrawColorText ("This text should cycle through random colors", 0, 0, 0, 1);

	for (int i = 0; i < 100; i ++)
	{
		usleep (20000);
		setColorPalette(0, 	rand() % 16, rand() % 16,rand() % 16); //set color 0 to random color;
		setColorPalette(1, 	rand() % 16, rand() % 16,rand() % 16); //set color 1 to random color;
	}

}

void basicVGATest()
{
	int i = 0;
	while (i<38400*4)
	{
		vga_ctrl->VRAM[i] = 0xff;
		i++;
	}
}




