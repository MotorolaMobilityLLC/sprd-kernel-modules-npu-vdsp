#ifndef XRP_LIBRARY_LOADER_H
#define XRP_LIBRARY_LOADER_H
#include <linux/mutex.h>
#define LIST_NO_MEM  -2
#define LIST_ERROR   -1
#define LIST_SUCCESS  0


enum load_unload_flag
{
	XRP_NOT_LOAD_UNLOAD = 0,
	XRP_LOAD_LIB_FLAG,
	XRP_UNLOAD_LIB_FLAG,
	XRP_LOAD_LIB_FLAG_MAX,
};
enum library_state
{
	XRP_LIBRARY_LOADING,
	XRP_LIBRARY_UNLOADING,
	XRP_LIBRARY_LOADED,
	XRP_LIBRARY_PROCESSING_CMD,
	XRP_LIBRARY_IDLE,
	XRP_LIBRARY_MISSED_STATE,
};
struct loadlib_info
{
	enum library_state lib_state;    /*valid_flag 0 is invalid may because vdsp side error , 1 is valid*/
	char libname[32];      /*libname , load_flag ==1 is valid, load_flag ==0 is invalid*/
	uint32_t address_start;      /*VDSP start logic address*/
	uint32_t length;            /*library length bytes*/
	void *ionhandle;  /*ion handle*/
	phys_addr_t ion_phy;
	void *ion_kaddr;
	void *code_back_kaddr;
	void *pil_ionhandle;
	uint32_t pil_info;
	void *pil_info_kaddr;
	struct mutex mutex;    /*cmd mutex*/
	uint32_t load_count;   /*load count when 0 it may unload*/
};


/*node*/
struct libinfo_node{
	struct libinfo_node *next;       //next node
	struct loadlib_info *element;      //pointer of elt
};

/*list*/
struct libinfo_list{
	int number;        //number of element of list
	struct libinfo_node *node;      //head pointer
};
struct xrp_load_lib_info
{
	struct mutex libload_mutex;
	struct libinfo_list lib_list;
};
struct xrp_request;
struct xvp;
struct xrp_comm;

enum load_unload_flag xrp_check_load_unload(struct xvp *xvp, struct xrp_request *rq);
int32_t xrp_pre_process_request(struct xvp *xvp, struct xrp_request *rq, enum load_unload_flag loadflag, char *libname);
int post_process_request(struct xvp *xvp, struct xrp_request *rq, const char* libname, enum load_unload_flag load_flag, int32_t resultflag);
int32_t xrp_library_release_all(struct xvp *xvp);
int32_t xrp_library_decrelease(struct xvp *xvp, const char *libname);
int32_t xrp_library_setall_missstate(struct xvp *xvp);

#endif
