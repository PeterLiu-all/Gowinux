#ifndef __GOWINUX_CLOCK_H__
#define __GOWINUX_CLOCK_H__

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

void clock_handler(int vector);
void clock_init();

#ifdef __cplusplus
}
#endif // __cplusplus

#endif /* __GOWINUX_CLOCK_H__ */
