#include "main.h"
#include "TinyJS.h"
#include "TinyJS_Functions.h"

static void SystemClock_Config(void);
void LEDToggle(CScriptVar *v, void *userdata);

//GPIO를 위한 셋
static GPIO_InitTypeDef  GPIO_InitStruct;

int main(int argc,char* argv[]){
	HAL_Init();
	/* Configure the system clock */

    __GPIOE_CLK_ENABLE();

    GPIO_InitStruct.Pin = GPIO_PIN_13;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_PULLUP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FAST;
    HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

    CTinyJS *js = new CTinyJS();
    registerFunctions(js);
    js->addNative("function Toggle(delay)", &LEDToggle, 0);

	while(1){
		try{
			js->execute("Toggle(100);");
			js->execute("Toggle(1000);");
			js->execute("Toggle(2000);");
			js->execute("Toggle(3000);");
		}catch(CScriptException e){

		}
	}
	return 0;
}

void LEDToggle(CScriptVar *v, void *userdata){
	int delay = v->getParameter("delay")->getInt();

    HAL_GPIO_TogglePin(GPIOE, GPIO_PIN_13);
    /* Insert delay 100 ms */
    HAL_Delay(delay);
}

static void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_OscInitTypeDef RCC_OscInitStruct;

  /* Enable HSE Oscillator and activate PLL with HSE as source */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 25;
  RCC_OscInitStruct.PLL.PLLN = 240;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 5;
  HAL_RCC_OscConfig(&RCC_OscInitStruct);

  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
     clocks dividers */
  RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;
  HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3);
}

