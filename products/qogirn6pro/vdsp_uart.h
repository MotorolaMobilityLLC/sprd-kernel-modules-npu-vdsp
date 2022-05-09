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
 
struct vdsp_uart_ops;
struct vdsp_uart_desc {
	struct vdsp_uart_ops *ops;
	struct regmap *mm_ahb_base;
	struct regmap *vdsp_cfg_base;
};

struct vdsp_uart_ops {
	int (*enable) (struct vdsp_uart_desc * ctx);
	int (*disable) (struct vdsp_uart_desc * ctx);

};

struct vdsp_uart_desc *get_vdsp_uart_desc(void);
