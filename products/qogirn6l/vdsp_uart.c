/*
 * Copyright (C) 2021 Unisoc Communications Inc.
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */
 
#include "vdsp_uart.h"

static int uart_enable(struct vdsp_uart_desc *ctx)
{

	return 0;
}

static int uart_disable(struct vdsp_uart_desc *ctx)
{

	return 0;
}

struct vdsp_uart_ops vdsp_uart_ops = {
	.enable = uart_enable,
	.disable = uart_disable,

};

static struct vdsp_uart_desc sub_uart_desc = {
	.ops = &vdsp_uart_ops,
};

struct vdsp_uart_desc *get_vdsp_uart_desc(void)
{
	return &sub_uart_desc;
}
