; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"pi_val"() nounwind {
entry:
  %t9 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.2)
  ret i64 %t9
}

define i64 @"clamp_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t10 = load i64, ptr %local.x
  %t11 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.3)
  %t12 = call i64 @"sx_f64_gt"(i64 %t10, i64 %t11)
  %t13 = icmp ne i64 %t12, 0
  br i1 %t13, label %then1, label %else1
then1:
  %t14 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.4)
  ret i64 %t14
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t15 = phi i64 [ 0, %else1_end ]
  %t16 = load i64, ptr %local.x
  %t17 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.5)
  %t18 = xor i64 %t17, -9223372036854775808
  %t19 = call i64 @"sx_f64_lt"(i64 %t16, i64 %t18)
  %t20 = icmp ne i64 %t19, 0
  br i1 %t20, label %then2, label %else2
then2:
  %t21 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.6)
  %t22 = xor i64 %t21, -9223372036854775808
  ret i64 %t22
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t23 = phi i64 [ 0, %else2_end ]
  %t24 = load i64, ptr %local.x
  ret i64 %t24
}

define i64 @"max5"(i64 %a, i64 %b, i64 %c, i64 %d, i64 %e) nounwind {
entry:
  %local.m.25 = alloca i64
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %local.c = alloca i64
  store i64 %c, ptr %local.c
  %local.d = alloca i64
  store i64 %d, ptr %local.d
  %local.e = alloca i64
  store i64 %e, ptr %local.e
  %t26 = load i64, ptr %local.a
  store i64 %t26, ptr %local.m.25
  %t27 = load i64, ptr %local.b
  %t28 = load i64, ptr %local.m.25
  %t29 = call i64 @"sx_f64_gt"(i64 %t27, i64 %t28)
  %t30 = icmp ne i64 %t29, 0
  br i1 %t30, label %then3, label %else3
then3:
  %t31 = load i64, ptr %local.b
  store i64 %t31, ptr %local.m.25
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t32 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t33 = load i64, ptr %local.c
  %t34 = load i64, ptr %local.m.25
  %t35 = call i64 @"sx_f64_gt"(i64 %t33, i64 %t34)
  %t36 = icmp ne i64 %t35, 0
  br i1 %t36, label %then4, label %else4
then4:
  %t37 = load i64, ptr %local.c
  store i64 %t37, ptr %local.m.25
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t38 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t39 = load i64, ptr %local.d
  %t40 = load i64, ptr %local.m.25
  %t41 = call i64 @"sx_f64_gt"(i64 %t39, i64 %t40)
  %t42 = icmp ne i64 %t41, 0
  br i1 %t42, label %then5, label %else5
then5:
  %t43 = load i64, ptr %local.d
  store i64 %t43, ptr %local.m.25
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t44 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t45 = load i64, ptr %local.e
  %t46 = load i64, ptr %local.m.25
  %t47 = call i64 @"sx_f64_gt"(i64 %t45, i64 %t46)
  %t48 = icmp ne i64 %t47, 0
  br i1 %t48, label %then6, label %else6
then6:
  %t49 = load i64, ptr %local.e
  store i64 %t49, ptr %local.m.25
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t50 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t51 = load i64, ptr %local.m.25
  ret i64 %t51
}

define i64 @"u_init_steep"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t52 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.7)
  %t53 = call i64 @"pi_val"()
  %t54 = call i64 @"sx_f64_mul"(i64 %t52, i64 %t53)
  %t55 = load i64, ptr %local.x
  %t56 = call i64 @"sx_f64_mul"(i64 %t54, i64 %t55)
  %t57 = call i64 @"sin_f64"(i64 %t56)
  %t58 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.8)
  %t59 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.9)
  %t60 = call i64 @"pi_val"()
  %t61 = call i64 @"sx_f64_mul"(i64 %t59, i64 %t60)
  %t62 = load i64, ptr %local.x
  %t63 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t62)
  %t64 = call i64 @"sin_f64"(i64 %t63)
  %t65 = call i64 @"sx_f64_mul"(i64 %t58, i64 %t64)
  %t66 = call i64 @"sx_f64_add"(i64 %t57, i64 %t65)
  ret i64 %t66
}

define i64 @"burgers_step_3pt"(i64 %ul, i64 %uc, i64 %ur, i64 %nu, i64 %dt, i64 %dx) nounwind {
entry:
  %local.dudx.67 = alloca i64
  %local.d2udx2.68 = alloca i64
  %local.advection.69 = alloca i64
  %local.diffusion.70 = alloca i64
  %local.ul = alloca i64
  store i64 %ul, ptr %local.ul
  %local.uc = alloca i64
  store i64 %uc, ptr %local.uc
  %local.ur = alloca i64
  store i64 %ur, ptr %local.ur
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t71 = load i64, ptr %local.ur
  %t72 = load i64, ptr %local.ul
  %t73 = call i64 @"sx_f64_sub"(i64 %t71, i64 %t72)
  %t74 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.10)
  %t75 = load i64, ptr %local.dx
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_div"(i64 %t73, i64 %t76)
  store i64 %t77, ptr %local.dudx.67
  %t78 = load i64, ptr %local.ur
  %t79 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.11)
  %t80 = load i64, ptr %local.uc
  %t81 = call i64 @"sx_f64_mul"(i64 %t79, i64 %t80)
  %t82 = call i64 @"sx_f64_sub"(i64 %t78, i64 %t81)
  %t83 = load i64, ptr %local.ul
  %t84 = call i64 @"sx_f64_add"(i64 %t82, i64 %t83)
  %t85 = load i64, ptr %local.dx
  %t86 = load i64, ptr %local.dx
  %t87 = call i64 @"sx_f64_mul"(i64 %t85, i64 %t86)
  %t88 = call i64 @"sx_f64_div"(i64 %t84, i64 %t87)
  store i64 %t88, ptr %local.d2udx2.68
  %t89 = load i64, ptr %local.uc
  %t90 = load i64, ptr %local.dudx.67
  %t91 = call i64 @"sx_f64_mul"(i64 %t89, i64 %t90)
  store i64 %t91, ptr %local.advection.69
  %t92 = load i64, ptr %local.nu
  %t93 = load i64, ptr %local.d2udx2.68
  %t94 = call i64 @"sx_f64_mul"(i64 %t92, i64 %t93)
  store i64 %t94, ptr %local.diffusion.70
  %t95 = load i64, ptr %local.uc
  %t96 = load i64, ptr %local.dt
  %t97 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.12)
  %t98 = load i64, ptr %local.advection.69
  %t99 = call i64 @"sx_f64_sub"(i64 %t97, i64 %t98)
  %t100 = load i64, ptr %local.diffusion.70
  %t101 = call i64 @"sx_f64_add"(i64 %t99, i64 %t100)
  %t102 = call i64 @"sx_f64_mul"(i64 %t96, i64 %t101)
  %t103 = call i64 @"sx_f64_add"(i64 %t95, i64 %t102)
  ret i64 %t103
}

define i64 @"max_grad_5pt"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %dx) nounwind {
entry:
  %local.g0.104 = alloca i64
  %local.g1.105 = alloca i64
  %local.g2.106 = alloca i64
  %local.g3.107 = alloca i64
  %local.g4.108 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t109 = load i64, ptr %local.u1
  %t110 = load i64, ptr %local.u4
  %t111 = call i64 @"sx_f64_sub"(i64 %t109, i64 %t110)
  %t112 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.13)
  %t113 = load i64, ptr %local.dx
  %t114 = call i64 @"sx_f64_mul"(i64 %t112, i64 %t113)
  %t115 = call i64 @"sx_f64_div"(i64 %t111, i64 %t114)
  %t116 = call i64 @"abs_f64"(i64 %t115)
  store i64 %t116, ptr %local.g0.104
  %t117 = load i64, ptr %local.u2
  %t118 = load i64, ptr %local.u0
  %t119 = call i64 @"sx_f64_sub"(i64 %t117, i64 %t118)
  %t120 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.14)
  %t121 = load i64, ptr %local.dx
  %t122 = call i64 @"sx_f64_mul"(i64 %t120, i64 %t121)
  %t123 = call i64 @"sx_f64_div"(i64 %t119, i64 %t122)
  %t124 = call i64 @"abs_f64"(i64 %t123)
  store i64 %t124, ptr %local.g1.105
  %t125 = load i64, ptr %local.u3
  %t126 = load i64, ptr %local.u1
  %t127 = call i64 @"sx_f64_sub"(i64 %t125, i64 %t126)
  %t128 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.15)
  %t129 = load i64, ptr %local.dx
  %t130 = call i64 @"sx_f64_mul"(i64 %t128, i64 %t129)
  %t131 = call i64 @"sx_f64_div"(i64 %t127, i64 %t130)
  %t132 = call i64 @"abs_f64"(i64 %t131)
  store i64 %t132, ptr %local.g2.106
  %t133 = load i64, ptr %local.u4
  %t134 = load i64, ptr %local.u2
  %t135 = call i64 @"sx_f64_sub"(i64 %t133, i64 %t134)
  %t136 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.16)
  %t137 = load i64, ptr %local.dx
  %t138 = call i64 @"sx_f64_mul"(i64 %t136, i64 %t137)
  %t139 = call i64 @"sx_f64_div"(i64 %t135, i64 %t138)
  %t140 = call i64 @"abs_f64"(i64 %t139)
  store i64 %t140, ptr %local.g3.107
  %t141 = load i64, ptr %local.u0
  %t142 = load i64, ptr %local.u3
  %t143 = call i64 @"sx_f64_sub"(i64 %t141, i64 %t142)
  %t144 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.17)
  %t145 = load i64, ptr %local.dx
  %t146 = call i64 @"sx_f64_mul"(i64 %t144, i64 %t145)
  %t147 = call i64 @"sx_f64_div"(i64 %t143, i64 %t146)
  %t148 = call i64 @"abs_f64"(i64 %t147)
  store i64 %t148, ptr %local.g4.108
  %t149 = load i64, ptr %local.g0.104
  %t150 = load i64, ptr %local.g1.105
  %t151 = load i64, ptr %local.g2.106
  %t152 = load i64, ptr %local.g3.107
  %t153 = load i64, ptr %local.g4.108
  %t154 = call i64 @"max5"(i64 %t149, i64 %t150, i64 %t151, i64 %t152, i64 %t153)
  ret i64 %t154
}

define i64 @"max_abs_5pt"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4) nounwind {
entry:
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %t155 = load i64, ptr %local.u0
  %t156 = call i64 @"abs_f64"(i64 %t155)
  %t157 = load i64, ptr %local.u1
  %t158 = call i64 @"abs_f64"(i64 %t157)
  %t159 = load i64, ptr %local.u2
  %t160 = call i64 @"abs_f64"(i64 %t159)
  %t161 = load i64, ptr %local.u3
  %t162 = call i64 @"abs_f64"(i64 %t161)
  %t163 = load i64, ptr %local.u4
  %t164 = call i64 @"abs_f64"(i64 %t163)
  %t165 = call i64 @"max5"(i64 %t156, i64 %t158, i64 %t160, i64 %t162, i64 %t164)
  ret i64 %t165
}

define i64 @"exp1_detect"(i64 %query) nounwind {
entry:
  %local.nu.166 = alloca i64
  %local.dx.167 = alloca i64
  %local.dt.168 = alloca i64
  %local.u0.169 = alloca i64
  %local.u1.170 = alloca i64
  %local.u2.171 = alloca i64
  %local.u3.172 = alloca i64
  %local.u4.173 = alloca i64
  %local.step.174 = alloca i64
  %local.detected.175 = alloca i64
  %local.win_sum.176 = alloca i64
  %local.win_count.177 = alloca i64
  %local.prev_win_avg.178 = alloca i64
  %local.prev_u0.179 = alloca i64
  %local.prev_u1.180 = alloca i64
  %local.prev_u2.181 = alloca i64
  %local.prev_u3.182 = alloca i64
  %local.prev_u4.183 = alloca i64
  %local.n0.184 = alloca i64
  %local.n1.185 = alloca i64
  %local.n2.186 = alloca i64
  %local.n3.187 = alloca i64
  %local.n4.188 = alloca i64
  %local.md.189 = alloca i64
  %local.wa.190 = alloca i64
  %local.sl.191 = alloca i64
  %local.mg.192 = alloca i64
  %local.mg.193 = alloca i64
  %local.mu.194 = alloca i64
  %local.mu.195 = alloca i64
  %local.query = alloca i64
  store i64 %query, ptr %local.query
  %t196 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.18)
  store i64 %t196, ptr %local.nu.166
  %t197 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.19)
  store i64 %t197, ptr %local.dx.167
  %t198 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.20)
  store i64 %t198, ptr %local.dt.168
  %t199 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.21)
  %t200 = call i64 @"u_init_steep"(i64 %t199)
  store i64 %t200, ptr %local.u0.169
  %t201 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.22)
  %t202 = call i64 @"u_init_steep"(i64 %t201)
  store i64 %t202, ptr %local.u1.170
  %t203 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.23)
  %t204 = call i64 @"u_init_steep"(i64 %t203)
  store i64 %t204, ptr %local.u2.171
  %t205 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.24)
  %t206 = call i64 @"u_init_steep"(i64 %t205)
  store i64 %t206, ptr %local.u3.172
  %t207 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.25)
  %t208 = call i64 @"u_init_steep"(i64 %t207)
  store i64 %t208, ptr %local.u4.173
  store i64 0, ptr %local.step.174
  %t209 = sub i64 0, 1
  store i64 %t209, ptr %local.detected.175
  %t210 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.26)
  store i64 %t210, ptr %local.win_sum.176
  store i64 0, ptr %local.win_count.177
  %t211 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.27)
  store i64 %t211, ptr %local.prev_win_avg.178
  %t212 = load i64, ptr %local.u0.169
  store i64 %t212, ptr %local.prev_u0.179
  %t213 = load i64, ptr %local.u1.170
  store i64 %t213, ptr %local.prev_u1.180
  %t214 = load i64, ptr %local.u2.171
  store i64 %t214, ptr %local.prev_u2.181
  %t215 = load i64, ptr %local.u3.172
  store i64 %t215, ptr %local.prev_u3.182
  %t216 = load i64, ptr %local.u4.173
  store i64 %t216, ptr %local.prev_u4.183
  br label %loop7
loop7:
  %t217 = load i64, ptr %local.step.174
  %t218 = icmp slt i64 %t217, 50000
  %t219 = zext i1 %t218 to i64
  %t220 = icmp ne i64 %t219, 0
  br i1 %t220, label %body7, label %endloop7
body7:
  %t221 = load i64, ptr %local.u4.173
  %t222 = load i64, ptr %local.u0.169
  %t223 = load i64, ptr %local.u1.170
  %t224 = load i64, ptr %local.nu.166
  %t225 = load i64, ptr %local.dt.168
  %t226 = load i64, ptr %local.dx.167
  %t227 = call i64 @"burgers_step_3pt"(i64 %t221, i64 %t222, i64 %t223, i64 %t224, i64 %t225, i64 %t226)
  store i64 %t227, ptr %local.n0.184
  %t228 = load i64, ptr %local.u0.169
  %t229 = load i64, ptr %local.u1.170
  %t230 = load i64, ptr %local.u2.171
  %t231 = load i64, ptr %local.nu.166
  %t232 = load i64, ptr %local.dt.168
  %t233 = load i64, ptr %local.dx.167
  %t234 = call i64 @"burgers_step_3pt"(i64 %t228, i64 %t229, i64 %t230, i64 %t231, i64 %t232, i64 %t233)
  store i64 %t234, ptr %local.n1.185
  %t235 = load i64, ptr %local.u1.170
  %t236 = load i64, ptr %local.u2.171
  %t237 = load i64, ptr %local.u3.172
  %t238 = load i64, ptr %local.nu.166
  %t239 = load i64, ptr %local.dt.168
  %t240 = load i64, ptr %local.dx.167
  %t241 = call i64 @"burgers_step_3pt"(i64 %t235, i64 %t236, i64 %t237, i64 %t238, i64 %t239, i64 %t240)
  store i64 %t241, ptr %local.n2.186
  %t242 = load i64, ptr %local.u2.171
  %t243 = load i64, ptr %local.u3.172
  %t244 = load i64, ptr %local.u4.173
  %t245 = load i64, ptr %local.nu.166
  %t246 = load i64, ptr %local.dt.168
  %t247 = load i64, ptr %local.dx.167
  %t248 = call i64 @"burgers_step_3pt"(i64 %t242, i64 %t243, i64 %t244, i64 %t245, i64 %t246, i64 %t247)
  store i64 %t248, ptr %local.n3.187
  %t249 = load i64, ptr %local.u3.172
  %t250 = load i64, ptr %local.u4.173
  %t251 = load i64, ptr %local.u0.169
  %t252 = load i64, ptr %local.nu.166
  %t253 = load i64, ptr %local.dt.168
  %t254 = load i64, ptr %local.dx.167
  %t255 = call i64 @"burgers_step_3pt"(i64 %t249, i64 %t250, i64 %t251, i64 %t252, i64 %t253, i64 %t254)
  store i64 %t255, ptr %local.n4.188
  %t256 = load i64, ptr %local.n0.184
  %t257 = call i64 @"clamp_f64"(i64 %t256)
  store i64 %t257, ptr %local.u0.169
  %t258 = load i64, ptr %local.n1.185
  %t259 = call i64 @"clamp_f64"(i64 %t258)
  store i64 %t259, ptr %local.u1.170
  %t260 = load i64, ptr %local.n2.186
  %t261 = call i64 @"clamp_f64"(i64 %t260)
  store i64 %t261, ptr %local.u2.171
  %t262 = load i64, ptr %local.n3.187
  %t263 = call i64 @"clamp_f64"(i64 %t262)
  store i64 %t263, ptr %local.u3.172
  %t264 = load i64, ptr %local.n4.188
  %t265 = call i64 @"clamp_f64"(i64 %t264)
  store i64 %t265, ptr %local.u4.173
  %t266 = load i64, ptr %local.detected.175
  %t267 = sub i64 0, 1
  %t268 = icmp eq i64 %t266, %t267
  %t269 = zext i1 %t268 to i64
  %t270 = icmp ne i64 %t269, 0
  br i1 %t270, label %then8, label %else8
then8:
  %t271 = load i64, ptr %local.query
  %t272 = icmp eq i64 %t271, 0
  %t273 = zext i1 %t272 to i64
  %t274 = icmp ne i64 %t273, 0
  br i1 %t274, label %then9, label %else9
then9:
  %t275 = load i64, ptr %local.u0.169
  %t276 = load i64, ptr %local.prev_u0.179
  %t277 = call i64 @"sx_f64_sub"(i64 %t275, i64 %t276)
  %t278 = call i64 @"abs_f64"(i64 %t277)
  %t279 = load i64, ptr %local.u1.170
  %t280 = load i64, ptr %local.prev_u1.180
  %t281 = call i64 @"sx_f64_sub"(i64 %t279, i64 %t280)
  %t282 = call i64 @"abs_f64"(i64 %t281)
  %t283 = load i64, ptr %local.u2.171
  %t284 = load i64, ptr %local.prev_u2.181
  %t285 = call i64 @"sx_f64_sub"(i64 %t283, i64 %t284)
  %t286 = call i64 @"abs_f64"(i64 %t285)
  %t287 = load i64, ptr %local.u3.172
  %t288 = load i64, ptr %local.prev_u3.182
  %t289 = call i64 @"sx_f64_sub"(i64 %t287, i64 %t288)
  %t290 = call i64 @"abs_f64"(i64 %t289)
  %t291 = load i64, ptr %local.u4.173
  %t292 = load i64, ptr %local.prev_u4.183
  %t293 = call i64 @"sx_f64_sub"(i64 %t291, i64 %t292)
  %t294 = call i64 @"abs_f64"(i64 %t293)
  %t295 = call i64 @"max5"(i64 %t278, i64 %t282, i64 %t286, i64 %t290, i64 %t294)
  store i64 %t295, ptr %local.md.189
  %t296 = load i64, ptr %local.win_sum.176
  %t297 = load i64, ptr %local.md.189
  %t298 = call i64 @"sx_f64_add"(i64 %t296, i64 %t297)
  store i64 %t298, ptr %local.win_sum.176
  %t299 = load i64, ptr %local.win_count.177
  %t300 = add i64 %t299, 1
  store i64 %t300, ptr %local.win_count.177
  %t301 = load i64, ptr %local.win_count.177
  %t302 = icmp sge i64 %t301, 200
  %t303 = zext i1 %t302 to i64
  %t304 = icmp ne i64 %t303, 0
  br i1 %t304, label %then10, label %else10
then10:
  %t305 = load i64, ptr %local.win_sum.176
  %t306 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.28)
  %t307 = call i64 @"sx_f64_div"(i64 %t305, i64 %t306)
  store i64 %t307, ptr %local.wa.190
  %t308 = load i64, ptr %local.prev_win_avg.178
  %t309 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.29)
  %t310 = call i64 @"sx_f64_gt"(i64 %t308, i64 %t309)
  %t311 = icmp ne i64 %t310, 0
  br i1 %t311, label %then11, label %else11
then11:
  %t312 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.30)
  %t313 = load i64, ptr %local.wa.190
  %t314 = load i64, ptr %local.prev_win_avg.178
  %t315 = call i64 @"sx_f64_div"(i64 %t313, i64 %t314)
  %t316 = call i64 @"sx_f64_sub"(i64 %t312, i64 %t315)
  store i64 %t316, ptr %local.sl.191
  %t317 = load i64, ptr %local.sl.191
  %t318 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.31)
  %t319 = call i64 @"sx_f64_lt"(i64 %t317, i64 %t318)
  %t320 = icmp ne i64 %t319, 0
  br i1 %t320, label %then12, label %else12
then12:
  %t321 = load i64, ptr %local.step.174
  store i64 %t321, ptr %local.detected.175
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t322 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t323 = phi i64 [ %t322, %then11_end ], [ 0, %else11_end ]
  %t324 = load i64, ptr %local.wa.190
  store i64 %t324, ptr %local.prev_win_avg.178
  %t325 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.32)
  store i64 %t325, ptr %local.win_sum.176
  store i64 0, ptr %local.win_count.177
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t326 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t327 = phi i64 [ %t326, %then9_end ], [ 0, %else9_end ]
  %t328 = load i64, ptr %local.query
  %t329 = icmp eq i64 %t328, 1
  %t330 = zext i1 %t329 to i64
  %t331 = icmp ne i64 %t330, 0
  br i1 %t331, label %then13, label %else13
then13:
  %t332 = load i64, ptr %local.u0.169
  %t333 = load i64, ptr %local.u1.170
  %t334 = load i64, ptr %local.u2.171
  %t335 = load i64, ptr %local.u3.172
  %t336 = load i64, ptr %local.u4.173
  %t337 = load i64, ptr %local.dx.167
  %t338 = call i64 @"max_grad_5pt"(i64 %t332, i64 %t333, i64 %t334, i64 %t335, i64 %t336, i64 %t337)
  store i64 %t338, ptr %local.mg.192
  %t339 = load i64, ptr %local.mg.192
  %t340 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.33)
  %t341 = call i64 @"sx_f64_gt"(i64 %t339, i64 %t340)
  %t342 = icmp ne i64 %t341, 0
  br i1 %t342, label %then14, label %else14
then14:
  %t343 = load i64, ptr %local.step.174
  store i64 %t343, ptr %local.detected.175
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t344 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t345 = phi i64 [ %t344, %then13_end ], [ 0, %else13_end ]
  %t346 = load i64, ptr %local.query
  %t347 = icmp eq i64 %t346, 2
  %t348 = zext i1 %t347 to i64
  %t349 = icmp ne i64 %t348, 0
  br i1 %t349, label %then15, label %else15
then15:
  %t350 = load i64, ptr %local.u0.169
  %t351 = load i64, ptr %local.u1.170
  %t352 = load i64, ptr %local.u2.171
  %t353 = load i64, ptr %local.u3.172
  %t354 = load i64, ptr %local.u4.173
  %t355 = load i64, ptr %local.dx.167
  %t356 = call i64 @"max_grad_5pt"(i64 %t350, i64 %t351, i64 %t352, i64 %t353, i64 %t354, i64 %t355)
  store i64 %t356, ptr %local.mg.193
  %t357 = load i64, ptr %local.mg.193
  %t358 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.34)
  %t359 = call i64 @"sx_f64_gt"(i64 %t357, i64 %t358)
  %t360 = icmp ne i64 %t359, 0
  br i1 %t360, label %then16, label %else16
then16:
  %t361 = load i64, ptr %local.step.174
  store i64 %t361, ptr %local.detected.175
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t362 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t363 = phi i64 [ %t362, %then15_end ], [ 0, %else15_end ]
  %t364 = load i64, ptr %local.query
  %t365 = icmp eq i64 %t364, 3
  %t366 = zext i1 %t365 to i64
  %t367 = icmp ne i64 %t366, 0
  br i1 %t367, label %then17, label %else17
then17:
  %t368 = load i64, ptr %local.u0.169
  %t369 = load i64, ptr %local.u1.170
  %t370 = load i64, ptr %local.u2.171
  %t371 = load i64, ptr %local.u3.172
  %t372 = load i64, ptr %local.u4.173
  %t373 = call i64 @"max_abs_5pt"(i64 %t368, i64 %t369, i64 %t370, i64 %t371, i64 %t372)
  store i64 %t373, ptr %local.mu.194
  %t374 = load i64, ptr %local.mu.194
  %t375 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.35)
  %t376 = call i64 @"sx_f64_gt"(i64 %t374, i64 %t375)
  %t377 = icmp ne i64 %t376, 0
  br i1 %t377, label %then18, label %else18
then18:
  %t378 = load i64, ptr %local.step.174
  store i64 %t378, ptr %local.detected.175
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t379 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t380 = phi i64 [ %t379, %then17_end ], [ 0, %else17_end ]
  %t381 = load i64, ptr %local.query
  %t382 = icmp eq i64 %t381, 4
  %t383 = zext i1 %t382 to i64
  %t384 = icmp ne i64 %t383, 0
  br i1 %t384, label %then19, label %else19
then19:
  %t385 = load i64, ptr %local.u0.169
  %t386 = load i64, ptr %local.u1.170
  %t387 = load i64, ptr %local.u2.171
  %t388 = load i64, ptr %local.u3.172
  %t389 = load i64, ptr %local.u4.173
  %t390 = call i64 @"max_abs_5pt"(i64 %t385, i64 %t386, i64 %t387, i64 %t388, i64 %t389)
  store i64 %t390, ptr %local.mu.195
  %t391 = load i64, ptr %local.mu.195
  %t392 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.36)
  %t393 = call i64 @"sx_f64_gt"(i64 %t391, i64 %t392)
  %t394 = icmp ne i64 %t393, 0
  br i1 %t394, label %then20, label %else20
then20:
  %t395 = load i64, ptr %local.step.174
  store i64 %t395, ptr %local.detected.175
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t396 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t397 = phi i64 [ %t396, %then19_end ], [ 0, %else19_end ]
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t398 = phi i64 [ %t397, %then8_end ], [ 0, %else8_end ]
  %t399 = load i64, ptr %local.u0.169
  store i64 %t399, ptr %local.prev_u0.179
  %t400 = load i64, ptr %local.u1.170
  store i64 %t400, ptr %local.prev_u1.180
  %t401 = load i64, ptr %local.u2.171
  store i64 %t401, ptr %local.prev_u2.181
  %t402 = load i64, ptr %local.u3.172
  store i64 %t402, ptr %local.prev_u3.182
  %t403 = load i64, ptr %local.u4.173
  store i64 %t403, ptr %local.prev_u4.183
  %t404 = load i64, ptr %local.step.174
  %t405 = add i64 %t404, 1
  store i64 %t405, ptr %local.step.174
  br label %loop7
endloop7:
  %t406 = load i64, ptr %local.detected.175
  ret i64 %t406
}

define i64 @"exp1_blowup_countdown"() nounwind {
entry:
  %local.s_neg.407 = alloca i64
  %local.grad10.408 = alloca i64
  %local.grad100.409 = alloca i64
  %local.u_gt2.410 = alloca i64
  %local.u_gt10.411 = alloca i64
  %t412 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.37)
  %t413 = ptrtoint ptr %t412 to i64
  %t414 = inttoptr i64 %t413 to ptr
  call void @intrinsic_println(ptr %t414)
  %t415 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.38)
  %t416 = ptrtoint ptr %t415 to i64
  %t417 = inttoptr i64 %t416 to ptr
  call void @intrinsic_println(ptr %t417)
  %t418 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.39)
  %t419 = ptrtoint ptr %t418 to i64
  %t420 = inttoptr i64 %t419 to ptr
  call void @intrinsic_println(ptr %t420)
  %t421 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.40)
  %t422 = ptrtoint ptr %t421 to i64
  %t423 = inttoptr i64 %t422 to ptr
  call void @intrinsic_println(ptr %t423)
  %t424 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.41)
  %t425 = ptrtoint ptr %t424 to i64
  %t426 = inttoptr i64 %t425 to ptr
  call void @intrinsic_println(ptr %t426)
  %t427 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.42)
  %t428 = ptrtoint ptr %t427 to i64
  %t429 = inttoptr i64 %t428 to ptr
  call void @intrinsic_println(ptr %t429)
  %t430 = call i64 @"exp1_detect"(i64 0)
  store i64 %t430, ptr %local.s_neg.407
  %t431 = call i64 @"exp1_detect"(i64 1)
  store i64 %t431, ptr %local.grad10.408
  %t432 = call i64 @"exp1_detect"(i64 2)
  store i64 %t432, ptr %local.grad100.409
  %t433 = call i64 @"exp1_detect"(i64 3)
  store i64 %t433, ptr %local.u_gt2.410
  %t434 = call i64 @"exp1_detect"(i64 4)
  store i64 %t434, ptr %local.u_gt10.411
  %t435 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.43)
  %t436 = ptrtoint ptr %t435 to i64
  %t437 = inttoptr i64 %t436 to ptr
  call void @intrinsic_println(ptr %t437)
  %t438 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.44)
  %t439 = ptrtoint ptr %t438 to i64
  %t440 = inttoptr i64 %t439 to ptr
  call void @intrinsic_println(ptr %t440)
  %t441 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.45)
  %t442 = ptrtoint ptr %t441 to i64
  %t443 = inttoptr i64 %t442 to ptr
  call void @intrinsic_print(ptr %t443)
  %t444 = load i64, ptr %local.s_neg.407
  call void @print_i64(i64 %t444)
  %t445 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.46)
  %t446 = ptrtoint ptr %t445 to i64
  %t447 = inttoptr i64 %t446 to ptr
  call void @intrinsic_println(ptr %t447)
  %t448 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.47)
  %t449 = ptrtoint ptr %t448 to i64
  %t450 = inttoptr i64 %t449 to ptr
  call void @intrinsic_print(ptr %t450)
  %t451 = load i64, ptr %local.grad10.408
  call void @print_i64(i64 %t451)
  %t452 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.48)
  %t453 = ptrtoint ptr %t452 to i64
  %t454 = inttoptr i64 %t453 to ptr
  call void @intrinsic_println(ptr %t454)
  %t455 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.49)
  %t456 = ptrtoint ptr %t455 to i64
  %t457 = inttoptr i64 %t456 to ptr
  call void @intrinsic_print(ptr %t457)
  %t458 = load i64, ptr %local.grad100.409
  call void @print_i64(i64 %t458)
  %t459 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.50)
  %t460 = ptrtoint ptr %t459 to i64
  %t461 = inttoptr i64 %t460 to ptr
  call void @intrinsic_println(ptr %t461)
  %t462 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.51)
  %t463 = ptrtoint ptr %t462 to i64
  %t464 = inttoptr i64 %t463 to ptr
  call void @intrinsic_print(ptr %t464)
  %t465 = load i64, ptr %local.u_gt2.410
  call void @print_i64(i64 %t465)
  %t466 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.52)
  %t467 = ptrtoint ptr %t466 to i64
  %t468 = inttoptr i64 %t467 to ptr
  call void @intrinsic_println(ptr %t468)
  %t469 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.53)
  %t470 = ptrtoint ptr %t469 to i64
  %t471 = inttoptr i64 %t470 to ptr
  call void @intrinsic_print(ptr %t471)
  %t472 = load i64, ptr %local.u_gt10.411
  call void @print_i64(i64 %t472)
  %t473 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.54)
  %t474 = ptrtoint ptr %t473 to i64
  %t475 = inttoptr i64 %t474 to ptr
  call void @intrinsic_println(ptr %t475)
  %t476 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.55)
  %t477 = ptrtoint ptr %t476 to i64
  %t478 = inttoptr i64 %t477 to ptr
  call void @intrinsic_println(ptr %t478)
  %t479 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.56)
  %t480 = ptrtoint ptr %t479 to i64
  %t481 = inttoptr i64 %t480 to ptr
  call void @intrinsic_println(ptr %t481)
  %t482 = load i64, ptr %local.s_neg.407
  %t483 = icmp sge i64 %t482, 0
  %t484 = zext i1 %t483 to i64
  %t485 = icmp ne i64 %t484, 0
  br i1 %t485, label %then21, label %else21
then21:
  %t486 = load i64, ptr %local.grad10.408
  %t487 = icmp sge i64 %t486, 0
  %t488 = zext i1 %t487 to i64
  %t489 = icmp ne i64 %t488, 0
  br i1 %t489, label %then22, label %else22
then22:
  %t490 = load i64, ptr %local.s_neg.407
  %t491 = load i64, ptr %local.grad10.408
  %t492 = icmp slt i64 %t490, %t491
  %t493 = zext i1 %t492 to i64
  %t494 = icmp ne i64 %t493, 0
  br i1 %t494, label %then23, label %else23
then23:
  %t495 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.57)
  %t496 = ptrtoint ptr %t495 to i64
  %t497 = inttoptr i64 %t496 to ptr
  call void @intrinsic_println(ptr %t497)
  %t498 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.58)
  %t499 = ptrtoint ptr %t498 to i64
  %t500 = inttoptr i64 %t499 to ptr
  call void @intrinsic_println(ptr %t500)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t501 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.59)
  %t502 = ptrtoint ptr %t501 to i64
  %t503 = inttoptr i64 %t502 to ptr
  call void @intrinsic_println(ptr %t503)
  %t504 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.60)
  %t505 = ptrtoint ptr %t504 to i64
  %t506 = inttoptr i64 %t505 to ptr
  call void @intrinsic_println(ptr %t506)
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t507 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t508 = phi i64 [ %t507, %then22_end ], [ 0, %else22_end ]
  %t509 = load i64, ptr %local.u_gt2.410
  %t510 = icmp sge i64 %t509, 0
  %t511 = zext i1 %t510 to i64
  %t512 = icmp ne i64 %t511, 0
  br i1 %t512, label %then24, label %else24
then24:
  %t513 = load i64, ptr %local.s_neg.407
  %t514 = load i64, ptr %local.u_gt2.410
  %t515 = icmp slt i64 %t513, %t514
  %t516 = zext i1 %t515 to i64
  %t517 = icmp ne i64 %t516, 0
  br i1 %t517, label %then25, label %else25
then25:
  %t518 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.61)
  %t519 = ptrtoint ptr %t518 to i64
  %t520 = inttoptr i64 %t519 to ptr
  call void @intrinsic_println(ptr %t520)
  %t521 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.62)
  %t522 = ptrtoint ptr %t521 to i64
  %t523 = inttoptr i64 %t522 to ptr
  call void @intrinsic_println(ptr %t523)
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t524 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t525 = phi i64 [ %t524, %then24_end ], [ 0, %else24_end ]
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t526 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.63)
  %t527 = ptrtoint ptr %t526 to i64
  %t528 = inttoptr i64 %t527 to ptr
  call void @intrinsic_println(ptr %t528)
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t529 = phi i64 [ %t525, %then21_end ], [ 0, %else21_end ]
  %t530 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.64)
  %t531 = ptrtoint ptr %t530 to i64
  %t532 = inttoptr i64 %t531 to ptr
  call void @intrinsic_println(ptr %t532)
  ret i64 0
}

define i64 @"run_one_trial"(i64 %nu, i64 %amp) nounwind {
entry:
  %local.dx.533 = alloca i64
  %local.dt.534 = alloca i64
  %local.u0.535 = alloca i64
  %local.u1.536 = alloca i64
  %local.u2.537 = alloca i64
  %local.u3.538 = alloca i64
  %local.u4.539 = alloca i64
  %local.step.540 = alloca i64
  %local.s_ever_neg.541 = alloca i64
  %local.max_u_ever.542 = alloca i64
  %local.win_sum.543 = alloca i64
  %local.win_count.544 = alloca i64
  %local.prev_win_avg.545 = alloca i64
  %local.prev_u0.546 = alloca i64
  %local.prev_u1.547 = alloca i64
  %local.prev_u2.548 = alloca i64
  %local.prev_u3.549 = alloca i64
  %local.prev_u4.550 = alloca i64
  %local.n0.551 = alloca i64
  %local.n1.552 = alloca i64
  %local.n2.553 = alloca i64
  %local.n3.554 = alloca i64
  %local.n4.555 = alloca i64
  %local.mu.556 = alloca i64
  %local.md.557 = alloca i64
  %local.wa.558 = alloca i64
  %local.sl.559 = alloca i64
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %t560 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.65)
  store i64 %t560, ptr %local.dx.533
  %t561 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.66)
  store i64 %t561, ptr %local.dt.534
  %t562 = load i64, ptr %local.amp
  %t563 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.67)
  %t564 = call i64 @"u_init_steep"(i64 %t563)
  %t565 = call i64 @"sx_f64_mul"(i64 %t562, i64 %t564)
  store i64 %t565, ptr %local.u0.535
  %t566 = load i64, ptr %local.amp
  %t567 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.68)
  %t568 = call i64 @"u_init_steep"(i64 %t567)
  %t569 = call i64 @"sx_f64_mul"(i64 %t566, i64 %t568)
  store i64 %t569, ptr %local.u1.536
  %t570 = load i64, ptr %local.amp
  %t571 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.69)
  %t572 = call i64 @"u_init_steep"(i64 %t571)
  %t573 = call i64 @"sx_f64_mul"(i64 %t570, i64 %t572)
  store i64 %t573, ptr %local.u2.537
  %t574 = load i64, ptr %local.amp
  %t575 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.70)
  %t576 = call i64 @"u_init_steep"(i64 %t575)
  %t577 = call i64 @"sx_f64_mul"(i64 %t574, i64 %t576)
  store i64 %t577, ptr %local.u3.538
  %t578 = load i64, ptr %local.amp
  %t579 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.71)
  %t580 = call i64 @"u_init_steep"(i64 %t579)
  %t581 = call i64 @"sx_f64_mul"(i64 %t578, i64 %t580)
  store i64 %t581, ptr %local.u4.539
  store i64 0, ptr %local.step.540
  store i64 0, ptr %local.s_ever_neg.541
  %t582 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.72)
  store i64 %t582, ptr %local.max_u_ever.542
  %t583 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.73)
  store i64 %t583, ptr %local.win_sum.543
  store i64 0, ptr %local.win_count.544
  %t584 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.74)
  store i64 %t584, ptr %local.prev_win_avg.545
  %t585 = load i64, ptr %local.u0.535
  store i64 %t585, ptr %local.prev_u0.546
  %t586 = load i64, ptr %local.u1.536
  store i64 %t586, ptr %local.prev_u1.547
  %t587 = load i64, ptr %local.u2.537
  store i64 %t587, ptr %local.prev_u2.548
  %t588 = load i64, ptr %local.u3.538
  store i64 %t588, ptr %local.prev_u3.549
  %t589 = load i64, ptr %local.u4.539
  store i64 %t589, ptr %local.prev_u4.550
  br label %loop26
loop26:
  %t590 = load i64, ptr %local.step.540
  %t591 = icmp slt i64 %t590, 10000
  %t592 = zext i1 %t591 to i64
  %t593 = icmp ne i64 %t592, 0
  br i1 %t593, label %body26, label %endloop26
body26:
  %t594 = load i64, ptr %local.u4.539
  %t595 = load i64, ptr %local.u0.535
  %t596 = load i64, ptr %local.u1.536
  %t597 = load i64, ptr %local.nu
  %t598 = load i64, ptr %local.dt.534
  %t599 = load i64, ptr %local.dx.533
  %t600 = call i64 @"burgers_step_3pt"(i64 %t594, i64 %t595, i64 %t596, i64 %t597, i64 %t598, i64 %t599)
  store i64 %t600, ptr %local.n0.551
  %t601 = load i64, ptr %local.u0.535
  %t602 = load i64, ptr %local.u1.536
  %t603 = load i64, ptr %local.u2.537
  %t604 = load i64, ptr %local.nu
  %t605 = load i64, ptr %local.dt.534
  %t606 = load i64, ptr %local.dx.533
  %t607 = call i64 @"burgers_step_3pt"(i64 %t601, i64 %t602, i64 %t603, i64 %t604, i64 %t605, i64 %t606)
  store i64 %t607, ptr %local.n1.552
  %t608 = load i64, ptr %local.u1.536
  %t609 = load i64, ptr %local.u2.537
  %t610 = load i64, ptr %local.u3.538
  %t611 = load i64, ptr %local.nu
  %t612 = load i64, ptr %local.dt.534
  %t613 = load i64, ptr %local.dx.533
  %t614 = call i64 @"burgers_step_3pt"(i64 %t608, i64 %t609, i64 %t610, i64 %t611, i64 %t612, i64 %t613)
  store i64 %t614, ptr %local.n2.553
  %t615 = load i64, ptr %local.u2.537
  %t616 = load i64, ptr %local.u3.538
  %t617 = load i64, ptr %local.u4.539
  %t618 = load i64, ptr %local.nu
  %t619 = load i64, ptr %local.dt.534
  %t620 = load i64, ptr %local.dx.533
  %t621 = call i64 @"burgers_step_3pt"(i64 %t615, i64 %t616, i64 %t617, i64 %t618, i64 %t619, i64 %t620)
  store i64 %t621, ptr %local.n3.554
  %t622 = load i64, ptr %local.u3.538
  %t623 = load i64, ptr %local.u4.539
  %t624 = load i64, ptr %local.u0.535
  %t625 = load i64, ptr %local.nu
  %t626 = load i64, ptr %local.dt.534
  %t627 = load i64, ptr %local.dx.533
  %t628 = call i64 @"burgers_step_3pt"(i64 %t622, i64 %t623, i64 %t624, i64 %t625, i64 %t626, i64 %t627)
  store i64 %t628, ptr %local.n4.555
  %t629 = load i64, ptr %local.n0.551
  %t630 = call i64 @"clamp_f64"(i64 %t629)
  store i64 %t630, ptr %local.u0.535
  %t631 = load i64, ptr %local.n1.552
  %t632 = call i64 @"clamp_f64"(i64 %t631)
  store i64 %t632, ptr %local.u1.536
  %t633 = load i64, ptr %local.n2.553
  %t634 = call i64 @"clamp_f64"(i64 %t633)
  store i64 %t634, ptr %local.u2.537
  %t635 = load i64, ptr %local.n3.554
  %t636 = call i64 @"clamp_f64"(i64 %t635)
  store i64 %t636, ptr %local.u3.538
  %t637 = load i64, ptr %local.n4.555
  %t638 = call i64 @"clamp_f64"(i64 %t637)
  store i64 %t638, ptr %local.u4.539
  %t639 = load i64, ptr %local.u0.535
  %t640 = load i64, ptr %local.u1.536
  %t641 = load i64, ptr %local.u2.537
  %t642 = load i64, ptr %local.u3.538
  %t643 = load i64, ptr %local.u4.539
  %t644 = call i64 @"max_abs_5pt"(i64 %t639, i64 %t640, i64 %t641, i64 %t642, i64 %t643)
  store i64 %t644, ptr %local.mu.556
  %t645 = load i64, ptr %local.mu.556
  %t646 = load i64, ptr %local.max_u_ever.542
  %t647 = call i64 @"sx_f64_gt"(i64 %t645, i64 %t646)
  %t648 = icmp ne i64 %t647, 0
  br i1 %t648, label %then27, label %else27
then27:
  %t649 = load i64, ptr %local.mu.556
  store i64 %t649, ptr %local.max_u_ever.542
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t650 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t651 = load i64, ptr %local.u0.535
  %t652 = load i64, ptr %local.prev_u0.546
  %t653 = call i64 @"sx_f64_sub"(i64 %t651, i64 %t652)
  %t654 = call i64 @"abs_f64"(i64 %t653)
  %t655 = load i64, ptr %local.u1.536
  %t656 = load i64, ptr %local.prev_u1.547
  %t657 = call i64 @"sx_f64_sub"(i64 %t655, i64 %t656)
  %t658 = call i64 @"abs_f64"(i64 %t657)
  %t659 = load i64, ptr %local.u2.537
  %t660 = load i64, ptr %local.prev_u2.548
  %t661 = call i64 @"sx_f64_sub"(i64 %t659, i64 %t660)
  %t662 = call i64 @"abs_f64"(i64 %t661)
  %t663 = load i64, ptr %local.u3.538
  %t664 = load i64, ptr %local.prev_u3.549
  %t665 = call i64 @"sx_f64_sub"(i64 %t663, i64 %t664)
  %t666 = call i64 @"abs_f64"(i64 %t665)
  %t667 = load i64, ptr %local.u4.539
  %t668 = load i64, ptr %local.prev_u4.550
  %t669 = call i64 @"sx_f64_sub"(i64 %t667, i64 %t668)
  %t670 = call i64 @"abs_f64"(i64 %t669)
  %t671 = call i64 @"max5"(i64 %t654, i64 %t658, i64 %t662, i64 %t666, i64 %t670)
  store i64 %t671, ptr %local.md.557
  %t672 = load i64, ptr %local.win_sum.543
  %t673 = load i64, ptr %local.md.557
  %t674 = call i64 @"sx_f64_add"(i64 %t672, i64 %t673)
  store i64 %t674, ptr %local.win_sum.543
  %t675 = load i64, ptr %local.win_count.544
  %t676 = add i64 %t675, 1
  store i64 %t676, ptr %local.win_count.544
  %t677 = load i64, ptr %local.win_count.544
  %t678 = icmp sge i64 %t677, 200
  %t679 = zext i1 %t678 to i64
  %t680 = icmp ne i64 %t679, 0
  br i1 %t680, label %then28, label %else28
then28:
  %t681 = load i64, ptr %local.win_sum.543
  %t682 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.75)
  %t683 = call i64 @"sx_f64_div"(i64 %t681, i64 %t682)
  store i64 %t683, ptr %local.wa.558
  %t684 = load i64, ptr %local.prev_win_avg.545
  %t685 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.76)
  %t686 = call i64 @"sx_f64_gt"(i64 %t684, i64 %t685)
  %t687 = icmp ne i64 %t686, 0
  br i1 %t687, label %then29, label %else29
then29:
  %t688 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.77)
  %t689 = load i64, ptr %local.wa.558
  %t690 = load i64, ptr %local.prev_win_avg.545
  %t691 = call i64 @"sx_f64_div"(i64 %t689, i64 %t690)
  %t692 = call i64 @"sx_f64_sub"(i64 %t688, i64 %t691)
  store i64 %t692, ptr %local.sl.559
  %t693 = load i64, ptr %local.sl.559
  %t694 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.78)
  %t695 = call i64 @"sx_f64_lt"(i64 %t693, i64 %t694)
  %t696 = icmp ne i64 %t695, 0
  br i1 %t696, label %then30, label %else30
then30:
  store i64 1, ptr %local.s_ever_neg.541
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t697 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t698 = phi i64 [ %t697, %then29_end ], [ 0, %else29_end ]
  %t699 = load i64, ptr %local.wa.558
  store i64 %t699, ptr %local.prev_win_avg.545
  %t700 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.79)
  store i64 %t700, ptr %local.win_sum.543
  store i64 0, ptr %local.win_count.544
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t701 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t702 = load i64, ptr %local.u0.535
  store i64 %t702, ptr %local.prev_u0.546
  %t703 = load i64, ptr %local.u1.536
  store i64 %t703, ptr %local.prev_u1.547
  %t704 = load i64, ptr %local.u2.537
  store i64 %t704, ptr %local.prev_u2.548
  %t705 = load i64, ptr %local.u3.538
  store i64 %t705, ptr %local.prev_u3.549
  %t706 = load i64, ptr %local.u4.539
  store i64 %t706, ptr %local.prev_u4.550
  %t707 = load i64, ptr %local.step.540
  %t708 = add i64 %t707, 1
  store i64 %t708, ptr %local.step.540
  br label %loop26
endloop26:
  %t709 = load i64, ptr %local.max_u_ever.542
  %t710 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.80)
  %t711 = call i64 @"sx_f64_gt"(i64 %t709, i64 %t710)
  %t712 = icmp ne i64 %t711, 0
  br i1 %t712, label %then31, label %else31
then31:
  %t713 = load i64, ptr %local.s_ever_neg.541
  %t714 = icmp eq i64 %t713, 0
  %t715 = zext i1 %t714 to i64
  %t716 = icmp ne i64 %t715, 0
  br i1 %t716, label %then32, label %else32
then32:
  ret i64 2
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t717 = phi i64 [ 0, %else32_end ]
  ret i64 3
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t718 = phi i64 [ 0, %else31_end ]
  %t719 = load i64, ptr %local.s_ever_neg.541
  %t720 = icmp eq i64 %t719, 0
  %t721 = zext i1 %t720 to i64
  %t722 = icmp ne i64 %t721, 0
  br i1 %t722, label %then33, label %else33
then33:
  ret i64 0
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t723 = phi i64 [ 0, %else33_end ]
  ret i64 1
}

define i64 @"exp2_smoothness_criterion"() nounwind {
entry:
  %local.cell_a.724 = alloca i64
  %local.cell_b.725 = alloca i64
  %local.cell_c.726 = alloca i64
  %local.cell_d.727 = alloca i64
  %local.trial.728 = alloca i64
  %local.vi.729 = alloca i64
  %local.nu.730 = alloca i64
  %local.ai.731 = alloca i64
  %local.amp.732 = alloca i64
  %local.result.733 = alloca i64
  %t734 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.81)
  %t735 = ptrtoint ptr %t734 to i64
  %t736 = inttoptr i64 %t735 to ptr
  call void @intrinsic_println(ptr %t736)
  %t737 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.82)
  %t738 = ptrtoint ptr %t737 to i64
  %t739 = inttoptr i64 %t738 to ptr
  call void @intrinsic_println(ptr %t739)
  %t740 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.83)
  %t741 = ptrtoint ptr %t740 to i64
  %t742 = inttoptr i64 %t741 to ptr
  call void @intrinsic_println(ptr %t742)
  %t743 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.84)
  %t744 = ptrtoint ptr %t743 to i64
  %t745 = inttoptr i64 %t744 to ptr
  call void @intrinsic_println(ptr %t745)
  %t746 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.85)
  %t747 = ptrtoint ptr %t746 to i64
  %t748 = inttoptr i64 %t747 to ptr
  call void @intrinsic_println(ptr %t748)
  %t749 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.86)
  %t750 = ptrtoint ptr %t749 to i64
  %t751 = inttoptr i64 %t750 to ptr
  call void @intrinsic_println(ptr %t751)
  store i64 0, ptr %local.cell_a.724
  store i64 0, ptr %local.cell_b.725
  store i64 0, ptr %local.cell_c.726
  store i64 0, ptr %local.cell_d.727
  store i64 0, ptr %local.trial.728
  store i64 0, ptr %local.vi.729
  br label %loop34
loop34:
  %t752 = load i64, ptr %local.vi.729
  %t753 = icmp slt i64 %t752, 10
  %t754 = zext i1 %t753 to i64
  %t755 = icmp ne i64 %t754, 0
  br i1 %t755, label %body34, label %endloop34
body34:
  %t756 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.87)
  store i64 %t756, ptr %local.nu.730
  %t757 = load i64, ptr %local.vi.729
  %t758 = icmp eq i64 %t757, 0
  %t759 = zext i1 %t758 to i64
  %t760 = icmp ne i64 %t759, 0
  br i1 %t760, label %then35, label %else35
then35:
  %t761 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.88)
  store i64 %t761, ptr %local.nu.730
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t762 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t763 = load i64, ptr %local.vi.729
  %t764 = icmp eq i64 %t763, 1
  %t765 = zext i1 %t764 to i64
  %t766 = icmp ne i64 %t765, 0
  br i1 %t766, label %then36, label %else36
then36:
  %t767 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.89)
  store i64 %t767, ptr %local.nu.730
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t768 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t769 = load i64, ptr %local.vi.729
  %t770 = icmp eq i64 %t769, 2
  %t771 = zext i1 %t770 to i64
  %t772 = icmp ne i64 %t771, 0
  br i1 %t772, label %then37, label %else37
then37:
  %t773 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.90)
  store i64 %t773, ptr %local.nu.730
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t774 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t775 = load i64, ptr %local.vi.729
  %t776 = icmp eq i64 %t775, 3
  %t777 = zext i1 %t776 to i64
  %t778 = icmp ne i64 %t777, 0
  br i1 %t778, label %then38, label %else38
then38:
  %t779 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.91)
  store i64 %t779, ptr %local.nu.730
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t780 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t781 = load i64, ptr %local.vi.729
  %t782 = icmp eq i64 %t781, 4
  %t783 = zext i1 %t782 to i64
  %t784 = icmp ne i64 %t783, 0
  br i1 %t784, label %then39, label %else39
then39:
  %t785 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.92)
  store i64 %t785, ptr %local.nu.730
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t786 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t787 = load i64, ptr %local.vi.729
  %t788 = icmp eq i64 %t787, 5
  %t789 = zext i1 %t788 to i64
  %t790 = icmp ne i64 %t789, 0
  br i1 %t790, label %then40, label %else40
then40:
  %t791 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.93)
  store i64 %t791, ptr %local.nu.730
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t792 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t793 = load i64, ptr %local.vi.729
  %t794 = icmp eq i64 %t793, 6
  %t795 = zext i1 %t794 to i64
  %t796 = icmp ne i64 %t795, 0
  br i1 %t796, label %then41, label %else41
then41:
  %t797 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.94)
  store i64 %t797, ptr %local.nu.730
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t798 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t799 = load i64, ptr %local.vi.729
  %t800 = icmp eq i64 %t799, 7
  %t801 = zext i1 %t800 to i64
  %t802 = icmp ne i64 %t801, 0
  br i1 %t802, label %then42, label %else42
then42:
  %t803 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.95)
  store i64 %t803, ptr %local.nu.730
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t804 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t805 = load i64, ptr %local.vi.729
  %t806 = icmp eq i64 %t805, 8
  %t807 = zext i1 %t806 to i64
  %t808 = icmp ne i64 %t807, 0
  br i1 %t808, label %then43, label %else43
then43:
  %t809 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.96)
  store i64 %t809, ptr %local.nu.730
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t810 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t811 = load i64, ptr %local.vi.729
  %t812 = icmp eq i64 %t811, 9
  %t813 = zext i1 %t812 to i64
  %t814 = icmp ne i64 %t813, 0
  br i1 %t814, label %then44, label %else44
then44:
  %t815 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.97)
  store i64 %t815, ptr %local.nu.730
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t816 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  store i64 0, ptr %local.ai.731
  br label %loop45
loop45:
  %t817 = load i64, ptr %local.ai.731
  %t818 = icmp slt i64 %t817, 10
  %t819 = zext i1 %t818 to i64
  %t820 = icmp ne i64 %t819, 0
  br i1 %t820, label %body45, label %endloop45
body45:
  %t821 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.98)
  store i64 %t821, ptr %local.amp.732
  %t822 = load i64, ptr %local.ai.731
  %t823 = icmp eq i64 %t822, 0
  %t824 = zext i1 %t823 to i64
  %t825 = icmp ne i64 %t824, 0
  br i1 %t825, label %then46, label %else46
then46:
  %t826 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.99)
  store i64 %t826, ptr %local.amp.732
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t827 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t828 = load i64, ptr %local.ai.731
  %t829 = icmp eq i64 %t828, 1
  %t830 = zext i1 %t829 to i64
  %t831 = icmp ne i64 %t830, 0
  br i1 %t831, label %then47, label %else47
then47:
  %t832 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.100)
  store i64 %t832, ptr %local.amp.732
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t833 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t834 = load i64, ptr %local.ai.731
  %t835 = icmp eq i64 %t834, 2
  %t836 = zext i1 %t835 to i64
  %t837 = icmp ne i64 %t836, 0
  br i1 %t837, label %then48, label %else48
then48:
  %t838 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.101)
  store i64 %t838, ptr %local.amp.732
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t839 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t840 = load i64, ptr %local.ai.731
  %t841 = icmp eq i64 %t840, 3
  %t842 = zext i1 %t841 to i64
  %t843 = icmp ne i64 %t842, 0
  br i1 %t843, label %then49, label %else49
then49:
  %t844 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.102)
  store i64 %t844, ptr %local.amp.732
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t845 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t846 = load i64, ptr %local.ai.731
  %t847 = icmp eq i64 %t846, 4
  %t848 = zext i1 %t847 to i64
  %t849 = icmp ne i64 %t848, 0
  br i1 %t849, label %then50, label %else50
then50:
  %t850 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.103)
  store i64 %t850, ptr %local.amp.732
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t851 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t852 = load i64, ptr %local.ai.731
  %t853 = icmp eq i64 %t852, 5
  %t854 = zext i1 %t853 to i64
  %t855 = icmp ne i64 %t854, 0
  br i1 %t855, label %then51, label %else51
then51:
  %t856 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.104)
  store i64 %t856, ptr %local.amp.732
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t857 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t858 = load i64, ptr %local.ai.731
  %t859 = icmp eq i64 %t858, 6
  %t860 = zext i1 %t859 to i64
  %t861 = icmp ne i64 %t860, 0
  br i1 %t861, label %then52, label %else52
then52:
  %t862 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.105)
  store i64 %t862, ptr %local.amp.732
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t863 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t864 = load i64, ptr %local.ai.731
  %t865 = icmp eq i64 %t864, 7
  %t866 = zext i1 %t865 to i64
  %t867 = icmp ne i64 %t866, 0
  br i1 %t867, label %then53, label %else53
then53:
  %t868 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.106)
  store i64 %t868, ptr %local.amp.732
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t869 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t870 = load i64, ptr %local.ai.731
  %t871 = icmp eq i64 %t870, 8
  %t872 = zext i1 %t871 to i64
  %t873 = icmp ne i64 %t872, 0
  br i1 %t873, label %then54, label %else54
then54:
  %t874 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.107)
  store i64 %t874, ptr %local.amp.732
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t875 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t876 = load i64, ptr %local.ai.731
  %t877 = icmp eq i64 %t876, 9
  %t878 = zext i1 %t877 to i64
  %t879 = icmp ne i64 %t878, 0
  br i1 %t879, label %then55, label %else55
then55:
  %t880 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.108)
  store i64 %t880, ptr %local.amp.732
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t881 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t882 = load i64, ptr %local.nu.730
  %t883 = load i64, ptr %local.amp.732
  %t884 = call i64 @"run_one_trial"(i64 %t882, i64 %t883)
  store i64 %t884, ptr %local.result.733
  %t885 = load i64, ptr %local.result.733
  %t886 = icmp eq i64 %t885, 0
  %t887 = zext i1 %t886 to i64
  %t888 = icmp ne i64 %t887, 0
  br i1 %t888, label %then56, label %else56
then56:
  %t889 = load i64, ptr %local.cell_a.724
  %t890 = add i64 %t889, 1
  store i64 %t890, ptr %local.cell_a.724
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t891 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t892 = load i64, ptr %local.result.733
  %t893 = icmp eq i64 %t892, 1
  %t894 = zext i1 %t893 to i64
  %t895 = icmp ne i64 %t894, 0
  br i1 %t895, label %then57, label %else57
then57:
  %t896 = load i64, ptr %local.cell_b.725
  %t897 = add i64 %t896, 1
  store i64 %t897, ptr %local.cell_b.725
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t898 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t899 = load i64, ptr %local.result.733
  %t900 = icmp eq i64 %t899, 2
  %t901 = zext i1 %t900 to i64
  %t902 = icmp ne i64 %t901, 0
  br i1 %t902, label %then58, label %else58
then58:
  %t903 = load i64, ptr %local.cell_c.726
  %t904 = add i64 %t903, 1
  store i64 %t904, ptr %local.cell_c.726
  br label %then58_end
then58_end:
  br label %endif58
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t905 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t906 = load i64, ptr %local.result.733
  %t907 = icmp eq i64 %t906, 3
  %t908 = zext i1 %t907 to i64
  %t909 = icmp ne i64 %t908, 0
  br i1 %t909, label %then59, label %else59
then59:
  %t910 = load i64, ptr %local.cell_d.727
  %t911 = add i64 %t910, 1
  store i64 %t911, ptr %local.cell_d.727
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t912 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t913 = load i64, ptr %local.trial.728
  %t914 = add i64 %t913, 1
  store i64 %t914, ptr %local.trial.728
  %t915 = load i64, ptr %local.ai.731
  %t916 = add i64 %t915, 1
  store i64 %t916, ptr %local.ai.731
  br label %loop45
endloop45:
  %t917 = load i64, ptr %local.vi.729
  %t918 = add i64 %t917, 1
  store i64 %t918, ptr %local.vi.729
  br label %loop34
endloop34:
  %t919 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.109)
  %t920 = ptrtoint ptr %t919 to i64
  %t921 = inttoptr i64 %t920 to ptr
  call void @intrinsic_println(ptr %t921)
  %t922 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.110)
  %t923 = ptrtoint ptr %t922 to i64
  %t924 = inttoptr i64 %t923 to ptr
  call void @intrinsic_println(ptr %t924)
  %t925 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.111)
  %t926 = ptrtoint ptr %t925 to i64
  %t927 = inttoptr i64 %t926 to ptr
  call void @intrinsic_println(ptr %t927)
  %t928 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.112)
  %t929 = ptrtoint ptr %t928 to i64
  %t930 = inttoptr i64 %t929 to ptr
  call void @intrinsic_println(ptr %t930)
  %t931 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.113)
  %t932 = ptrtoint ptr %t931 to i64
  %t933 = inttoptr i64 %t932 to ptr
  call void @intrinsic_print(ptr %t933)
  %t934 = load i64, ptr %local.cell_a.724
  call void @print_i64(i64 %t934)
  %t935 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.114)
  %t936 = ptrtoint ptr %t935 to i64
  %t937 = inttoptr i64 %t936 to ptr
  call void @intrinsic_print(ptr %t937)
  %t938 = load i64, ptr %local.cell_b.725
  call void @print_i64(i64 %t938)
  %t939 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.115)
  %t940 = ptrtoint ptr %t939 to i64
  %t941 = inttoptr i64 %t940 to ptr
  call void @intrinsic_println(ptr %t941)
  %t942 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.116)
  %t943 = ptrtoint ptr %t942 to i64
  %t944 = inttoptr i64 %t943 to ptr
  call void @intrinsic_print(ptr %t944)
  %t945 = load i64, ptr %local.cell_c.726
  call void @print_i64(i64 %t945)
  %t946 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.117)
  %t947 = ptrtoint ptr %t946 to i64
  %t948 = inttoptr i64 %t947 to ptr
  call void @intrinsic_print(ptr %t948)
  %t949 = load i64, ptr %local.cell_d.727
  call void @print_i64(i64 %t949)
  %t950 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.118)
  %t951 = ptrtoint ptr %t950 to i64
  %t952 = inttoptr i64 %t951 to ptr
  call void @intrinsic_println(ptr %t952)
  %t953 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.119)
  %t954 = ptrtoint ptr %t953 to i64
  %t955 = inttoptr i64 %t954 to ptr
  call void @intrinsic_println(ptr %t955)
  %t956 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.120)
  %t957 = ptrtoint ptr %t956 to i64
  %t958 = inttoptr i64 %t957 to ptr
  call void @intrinsic_println(ptr %t958)
  %t959 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.121)
  %t960 = ptrtoint ptr %t959 to i64
  %t961 = inttoptr i64 %t960 to ptr
  call void @intrinsic_print(ptr %t961)
  %t962 = load i64, ptr %local.trial.728
  call void @print_i64(i64 %t962)
  %t963 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.122)
  %t964 = ptrtoint ptr %t963 to i64
  %t965 = inttoptr i64 %t964 to ptr
  call void @intrinsic_println(ptr %t965)
  %t966 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.123)
  %t967 = ptrtoint ptr %t966 to i64
  %t968 = inttoptr i64 %t967 to ptr
  call void @intrinsic_println(ptr %t968)
  %t969 = load i64, ptr %local.cell_c.726
  %t970 = icmp eq i64 %t969, 0
  %t971 = zext i1 %t970 to i64
  %t972 = icmp ne i64 %t971, 0
  br i1 %t972, label %then60, label %else60
then60:
  %t973 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.124)
  %t974 = ptrtoint ptr %t973 to i64
  %t975 = inttoptr i64 %t974 to ptr
  call void @intrinsic_println(ptr %t975)
  %t976 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.125)
  %t977 = ptrtoint ptr %t976 to i64
  %t978 = inttoptr i64 %t977 to ptr
  call void @intrinsic_println(ptr %t978)
  br label %then60_end
then60_end:
  br label %endif60
else60:
  %t979 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.126)
  %t980 = ptrtoint ptr %t979 to i64
  %t981 = inttoptr i64 %t980 to ptr
  call void @intrinsic_println(ptr %t981)
  %t982 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.127)
  %t983 = ptrtoint ptr %t982 to i64
  %t984 = inttoptr i64 %t983 to ptr
  call void @intrinsic_println(ptr %t984)
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t985 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  %t986 = load i64, ptr %local.cell_b.725
  %t987 = icmp eq i64 %t986, 0
  %t988 = zext i1 %t987 to i64
  %t989 = icmp ne i64 %t988, 0
  br i1 %t989, label %then61, label %else61
then61:
  %t990 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.128)
  %t991 = ptrtoint ptr %t990 to i64
  %t992 = inttoptr i64 %t991 to ptr
  call void @intrinsic_println(ptr %t992)
  %t993 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.129)
  %t994 = ptrtoint ptr %t993 to i64
  %t995 = inttoptr i64 %t994 to ptr
  call void @intrinsic_println(ptr %t995)
  br label %then61_end
then61_end:
  br label %endif61
else61:
  %t996 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.130)
  %t997 = ptrtoint ptr %t996 to i64
  %t998 = inttoptr i64 %t997 to ptr
  call void @intrinsic_println(ptr %t998)
  %t999 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.131)
  %t1000 = ptrtoint ptr %t999 to i64
  %t1001 = inttoptr i64 %t1000 to ptr
  call void @intrinsic_println(ptr %t1001)
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t1002 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t1003 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.132)
  %t1004 = ptrtoint ptr %t1003 to i64
  %t1005 = inttoptr i64 %t1004 to ptr
  call void @intrinsic_println(ptr %t1005)
  ret i64 0
}

define i64 @"max_grad_10pt"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %u5, i64 %u6, i64 %u7, i64 %u8, i64 %u9, i64 %dx) nounwind {
entry:
  %local.g0.1006 = alloca i64
  %local.g1.1007 = alloca i64
  %local.g2.1008 = alloca i64
  %local.g3.1009 = alloca i64
  %local.g4.1010 = alloca i64
  %local.g5.1011 = alloca i64
  %local.g6.1012 = alloca i64
  %local.g7.1013 = alloca i64
  %local.g8.1014 = alloca i64
  %local.g9.1015 = alloca i64
  %local.m.1016 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.u5 = alloca i64
  store i64 %u5, ptr %local.u5
  %local.u6 = alloca i64
  store i64 %u6, ptr %local.u6
  %local.u7 = alloca i64
  store i64 %u7, ptr %local.u7
  %local.u8 = alloca i64
  store i64 %u8, ptr %local.u8
  %local.u9 = alloca i64
  store i64 %u9, ptr %local.u9
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t1017 = load i64, ptr %local.u1
  %t1018 = load i64, ptr %local.u9
  %t1019 = call i64 @"sx_f64_sub"(i64 %t1017, i64 %t1018)
  %t1020 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.133)
  %t1021 = load i64, ptr %local.dx
  %t1022 = call i64 @"sx_f64_mul"(i64 %t1020, i64 %t1021)
  %t1023 = call i64 @"sx_f64_div"(i64 %t1019, i64 %t1022)
  %t1024 = call i64 @"abs_f64"(i64 %t1023)
  store i64 %t1024, ptr %local.g0.1006
  %t1025 = load i64, ptr %local.u2
  %t1026 = load i64, ptr %local.u0
  %t1027 = call i64 @"sx_f64_sub"(i64 %t1025, i64 %t1026)
  %t1028 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.134)
  %t1029 = load i64, ptr %local.dx
  %t1030 = call i64 @"sx_f64_mul"(i64 %t1028, i64 %t1029)
  %t1031 = call i64 @"sx_f64_div"(i64 %t1027, i64 %t1030)
  %t1032 = call i64 @"abs_f64"(i64 %t1031)
  store i64 %t1032, ptr %local.g1.1007
  %t1033 = load i64, ptr %local.u3
  %t1034 = load i64, ptr %local.u1
  %t1035 = call i64 @"sx_f64_sub"(i64 %t1033, i64 %t1034)
  %t1036 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.135)
  %t1037 = load i64, ptr %local.dx
  %t1038 = call i64 @"sx_f64_mul"(i64 %t1036, i64 %t1037)
  %t1039 = call i64 @"sx_f64_div"(i64 %t1035, i64 %t1038)
  %t1040 = call i64 @"abs_f64"(i64 %t1039)
  store i64 %t1040, ptr %local.g2.1008
  %t1041 = load i64, ptr %local.u4
  %t1042 = load i64, ptr %local.u2
  %t1043 = call i64 @"sx_f64_sub"(i64 %t1041, i64 %t1042)
  %t1044 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.136)
  %t1045 = load i64, ptr %local.dx
  %t1046 = call i64 @"sx_f64_mul"(i64 %t1044, i64 %t1045)
  %t1047 = call i64 @"sx_f64_div"(i64 %t1043, i64 %t1046)
  %t1048 = call i64 @"abs_f64"(i64 %t1047)
  store i64 %t1048, ptr %local.g3.1009
  %t1049 = load i64, ptr %local.u5
  %t1050 = load i64, ptr %local.u3
  %t1051 = call i64 @"sx_f64_sub"(i64 %t1049, i64 %t1050)
  %t1052 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.137)
  %t1053 = load i64, ptr %local.dx
  %t1054 = call i64 @"sx_f64_mul"(i64 %t1052, i64 %t1053)
  %t1055 = call i64 @"sx_f64_div"(i64 %t1051, i64 %t1054)
  %t1056 = call i64 @"abs_f64"(i64 %t1055)
  store i64 %t1056, ptr %local.g4.1010
  %t1057 = load i64, ptr %local.u6
  %t1058 = load i64, ptr %local.u4
  %t1059 = call i64 @"sx_f64_sub"(i64 %t1057, i64 %t1058)
  %t1060 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.138)
  %t1061 = load i64, ptr %local.dx
  %t1062 = call i64 @"sx_f64_mul"(i64 %t1060, i64 %t1061)
  %t1063 = call i64 @"sx_f64_div"(i64 %t1059, i64 %t1062)
  %t1064 = call i64 @"abs_f64"(i64 %t1063)
  store i64 %t1064, ptr %local.g5.1011
  %t1065 = load i64, ptr %local.u7
  %t1066 = load i64, ptr %local.u5
  %t1067 = call i64 @"sx_f64_sub"(i64 %t1065, i64 %t1066)
  %t1068 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.139)
  %t1069 = load i64, ptr %local.dx
  %t1070 = call i64 @"sx_f64_mul"(i64 %t1068, i64 %t1069)
  %t1071 = call i64 @"sx_f64_div"(i64 %t1067, i64 %t1070)
  %t1072 = call i64 @"abs_f64"(i64 %t1071)
  store i64 %t1072, ptr %local.g6.1012
  %t1073 = load i64, ptr %local.u8
  %t1074 = load i64, ptr %local.u6
  %t1075 = call i64 @"sx_f64_sub"(i64 %t1073, i64 %t1074)
  %t1076 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.140)
  %t1077 = load i64, ptr %local.dx
  %t1078 = call i64 @"sx_f64_mul"(i64 %t1076, i64 %t1077)
  %t1079 = call i64 @"sx_f64_div"(i64 %t1075, i64 %t1078)
  %t1080 = call i64 @"abs_f64"(i64 %t1079)
  store i64 %t1080, ptr %local.g7.1013
  %t1081 = load i64, ptr %local.u9
  %t1082 = load i64, ptr %local.u7
  %t1083 = call i64 @"sx_f64_sub"(i64 %t1081, i64 %t1082)
  %t1084 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.141)
  %t1085 = load i64, ptr %local.dx
  %t1086 = call i64 @"sx_f64_mul"(i64 %t1084, i64 %t1085)
  %t1087 = call i64 @"sx_f64_div"(i64 %t1083, i64 %t1086)
  %t1088 = call i64 @"abs_f64"(i64 %t1087)
  store i64 %t1088, ptr %local.g8.1014
  %t1089 = load i64, ptr %local.u0
  %t1090 = load i64, ptr %local.u8
  %t1091 = call i64 @"sx_f64_sub"(i64 %t1089, i64 %t1090)
  %t1092 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.142)
  %t1093 = load i64, ptr %local.dx
  %t1094 = call i64 @"sx_f64_mul"(i64 %t1092, i64 %t1093)
  %t1095 = call i64 @"sx_f64_div"(i64 %t1091, i64 %t1094)
  %t1096 = call i64 @"abs_f64"(i64 %t1095)
  store i64 %t1096, ptr %local.g9.1015
  %t1097 = load i64, ptr %local.g0.1006
  store i64 %t1097, ptr %local.m.1016
  %t1098 = load i64, ptr %local.g1.1007
  %t1099 = load i64, ptr %local.m.1016
  %t1100 = call i64 @"sx_f64_gt"(i64 %t1098, i64 %t1099)
  %t1101 = icmp ne i64 %t1100, 0
  br i1 %t1101, label %then62, label %else62
then62:
  %t1102 = load i64, ptr %local.g1.1007
  store i64 %t1102, ptr %local.m.1016
  br label %then62_end
then62_end:
  br label %endif62
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t1103 = phi i64 [ 0, %then62_end ], [ 0, %else62_end ]
  %t1104 = load i64, ptr %local.g2.1008
  %t1105 = load i64, ptr %local.m.1016
  %t1106 = call i64 @"sx_f64_gt"(i64 %t1104, i64 %t1105)
  %t1107 = icmp ne i64 %t1106, 0
  br i1 %t1107, label %then63, label %else63
then63:
  %t1108 = load i64, ptr %local.g2.1008
  store i64 %t1108, ptr %local.m.1016
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t1109 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t1110 = load i64, ptr %local.g3.1009
  %t1111 = load i64, ptr %local.m.1016
  %t1112 = call i64 @"sx_f64_gt"(i64 %t1110, i64 %t1111)
  %t1113 = icmp ne i64 %t1112, 0
  br i1 %t1113, label %then64, label %else64
then64:
  %t1114 = load i64, ptr %local.g3.1009
  store i64 %t1114, ptr %local.m.1016
  br label %then64_end
then64_end:
  br label %endif64
else64:
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t1115 = phi i64 [ 0, %then64_end ], [ 0, %else64_end ]
  %t1116 = load i64, ptr %local.g4.1010
  %t1117 = load i64, ptr %local.m.1016
  %t1118 = call i64 @"sx_f64_gt"(i64 %t1116, i64 %t1117)
  %t1119 = icmp ne i64 %t1118, 0
  br i1 %t1119, label %then65, label %else65
then65:
  %t1120 = load i64, ptr %local.g4.1010
  store i64 %t1120, ptr %local.m.1016
  br label %then65_end
then65_end:
  br label %endif65
else65:
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t1121 = phi i64 [ 0, %then65_end ], [ 0, %else65_end ]
  %t1122 = load i64, ptr %local.g5.1011
  %t1123 = load i64, ptr %local.m.1016
  %t1124 = call i64 @"sx_f64_gt"(i64 %t1122, i64 %t1123)
  %t1125 = icmp ne i64 %t1124, 0
  br i1 %t1125, label %then66, label %else66
then66:
  %t1126 = load i64, ptr %local.g5.1011
  store i64 %t1126, ptr %local.m.1016
  br label %then66_end
then66_end:
  br label %endif66
else66:
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t1127 = phi i64 [ 0, %then66_end ], [ 0, %else66_end ]
  %t1128 = load i64, ptr %local.g6.1012
  %t1129 = load i64, ptr %local.m.1016
  %t1130 = call i64 @"sx_f64_gt"(i64 %t1128, i64 %t1129)
  %t1131 = icmp ne i64 %t1130, 0
  br i1 %t1131, label %then67, label %else67
then67:
  %t1132 = load i64, ptr %local.g6.1012
  store i64 %t1132, ptr %local.m.1016
  br label %then67_end
then67_end:
  br label %endif67
else67:
  br label %else67_end
else67_end:
  br label %endif67
endif67:
  %t1133 = phi i64 [ 0, %then67_end ], [ 0, %else67_end ]
  %t1134 = load i64, ptr %local.g7.1013
  %t1135 = load i64, ptr %local.m.1016
  %t1136 = call i64 @"sx_f64_gt"(i64 %t1134, i64 %t1135)
  %t1137 = icmp ne i64 %t1136, 0
  br i1 %t1137, label %then68, label %else68
then68:
  %t1138 = load i64, ptr %local.g7.1013
  store i64 %t1138, ptr %local.m.1016
  br label %then68_end
then68_end:
  br label %endif68
else68:
  br label %else68_end
else68_end:
  br label %endif68
endif68:
  %t1139 = phi i64 [ 0, %then68_end ], [ 0, %else68_end ]
  %t1140 = load i64, ptr %local.g8.1014
  %t1141 = load i64, ptr %local.m.1016
  %t1142 = call i64 @"sx_f64_gt"(i64 %t1140, i64 %t1141)
  %t1143 = icmp ne i64 %t1142, 0
  br i1 %t1143, label %then69, label %else69
then69:
  %t1144 = load i64, ptr %local.g8.1014
  store i64 %t1144, ptr %local.m.1016
  br label %then69_end
then69_end:
  br label %endif69
else69:
  br label %else69_end
else69_end:
  br label %endif69
endif69:
  %t1145 = phi i64 [ 0, %then69_end ], [ 0, %else69_end ]
  %t1146 = load i64, ptr %local.g9.1015
  %t1147 = load i64, ptr %local.m.1016
  %t1148 = call i64 @"sx_f64_gt"(i64 %t1146, i64 %t1147)
  %t1149 = icmp ne i64 %t1148, 0
  br i1 %t1149, label %then70, label %else70
then70:
  %t1150 = load i64, ptr %local.g9.1015
  store i64 %t1150, ptr %local.m.1016
  br label %then70_end
then70_end:
  br label %endif70
else70:
  br label %else70_end
else70_end:
  br label %endif70
endif70:
  %t1151 = phi i64 [ 0, %then70_end ], [ 0, %else70_end ]
  %t1152 = load i64, ptr %local.m.1016
  ret i64 %t1152
}

define i64 @"exp3_run"(i64 %query) nounwind {
entry:
  %local.nu.1153 = alloca i64
  %local.dx.1154 = alloca i64
  %local.dt.1155 = alloca i64
  %local.u0.1156 = alloca i64
  %local.u1.1157 = alloca i64
  %local.u2.1158 = alloca i64
  %local.u3.1159 = alloca i64
  %local.u4.1160 = alloca i64
  %local.u5.1161 = alloca i64
  %local.u6.1162 = alloca i64
  %local.u7.1163 = alloca i64
  %local.u8.1164 = alloca i64
  %local.u9.1165 = alloca i64
  %local.step.1166 = alloca i64
  %local.bkm.1167 = alloca i64
  %local.result.1168 = alloca i64
  %local.n0.1169 = alloca i64
  %local.n1.1170 = alloca i64
  %local.n2.1171 = alloca i64
  %local.n3.1172 = alloca i64
  %local.n4.1173 = alloca i64
  %local.n5.1174 = alloca i64
  %local.n6.1175 = alloca i64
  %local.n7.1176 = alloca i64
  %local.n8.1177 = alloca i64
  %local.n9.1178 = alloca i64
  %local.mg.1179 = alloca i64
  %local.query = alloca i64
  store i64 %query, ptr %local.query
  %t1180 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.143)
  store i64 %t1180, ptr %local.nu.1153
  %t1181 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.144)
  store i64 %t1181, ptr %local.dx.1154
  %t1182 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.145)
  store i64 %t1182, ptr %local.dt.1155
  %t1183 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.146)
  %t1184 = call i64 @"u_init_steep"(i64 %t1183)
  store i64 %t1184, ptr %local.u0.1156
  %t1185 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.147)
  %t1186 = call i64 @"u_init_steep"(i64 %t1185)
  store i64 %t1186, ptr %local.u1.1157
  %t1187 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.148)
  %t1188 = call i64 @"u_init_steep"(i64 %t1187)
  store i64 %t1188, ptr %local.u2.1158
  %t1189 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.149)
  %t1190 = call i64 @"u_init_steep"(i64 %t1189)
  store i64 %t1190, ptr %local.u3.1159
  %t1191 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.150)
  %t1192 = call i64 @"u_init_steep"(i64 %t1191)
  store i64 %t1192, ptr %local.u4.1160
  %t1193 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.151)
  %t1194 = call i64 @"u_init_steep"(i64 %t1193)
  store i64 %t1194, ptr %local.u5.1161
  %t1195 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.152)
  %t1196 = call i64 @"u_init_steep"(i64 %t1195)
  store i64 %t1196, ptr %local.u6.1162
  %t1197 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.153)
  %t1198 = call i64 @"u_init_steep"(i64 %t1197)
  store i64 %t1198, ptr %local.u7.1163
  %t1199 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.154)
  %t1200 = call i64 @"u_init_steep"(i64 %t1199)
  store i64 %t1200, ptr %local.u8.1164
  %t1201 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.155)
  %t1202 = call i64 @"u_init_steep"(i64 %t1201)
  store i64 %t1202, ptr %local.u9.1165
  store i64 0, ptr %local.step.1166
  %t1203 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.156)
  store i64 %t1203, ptr %local.bkm.1167
  %t1204 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.157)
  store i64 %t1204, ptr %local.result.1168
  br label %loop71
loop71:
  %t1205 = load i64, ptr %local.step.1166
  %t1206 = icmp slt i64 %t1205, 50000
  %t1207 = zext i1 %t1206 to i64
  %t1208 = icmp ne i64 %t1207, 0
  br i1 %t1208, label %body71, label %endloop71
body71:
  %t1209 = load i64, ptr %local.u9.1165
  %t1210 = load i64, ptr %local.u0.1156
  %t1211 = load i64, ptr %local.u1.1157
  %t1212 = load i64, ptr %local.nu.1153
  %t1213 = load i64, ptr %local.dt.1155
  %t1214 = load i64, ptr %local.dx.1154
  %t1215 = call i64 @"burgers_step_3pt"(i64 %t1209, i64 %t1210, i64 %t1211, i64 %t1212, i64 %t1213, i64 %t1214)
  store i64 %t1215, ptr %local.n0.1169
  %t1216 = load i64, ptr %local.u0.1156
  %t1217 = load i64, ptr %local.u1.1157
  %t1218 = load i64, ptr %local.u2.1158
  %t1219 = load i64, ptr %local.nu.1153
  %t1220 = load i64, ptr %local.dt.1155
  %t1221 = load i64, ptr %local.dx.1154
  %t1222 = call i64 @"burgers_step_3pt"(i64 %t1216, i64 %t1217, i64 %t1218, i64 %t1219, i64 %t1220, i64 %t1221)
  store i64 %t1222, ptr %local.n1.1170
  %t1223 = load i64, ptr %local.u1.1157
  %t1224 = load i64, ptr %local.u2.1158
  %t1225 = load i64, ptr %local.u3.1159
  %t1226 = load i64, ptr %local.nu.1153
  %t1227 = load i64, ptr %local.dt.1155
  %t1228 = load i64, ptr %local.dx.1154
  %t1229 = call i64 @"burgers_step_3pt"(i64 %t1223, i64 %t1224, i64 %t1225, i64 %t1226, i64 %t1227, i64 %t1228)
  store i64 %t1229, ptr %local.n2.1171
  %t1230 = load i64, ptr %local.u2.1158
  %t1231 = load i64, ptr %local.u3.1159
  %t1232 = load i64, ptr %local.u4.1160
  %t1233 = load i64, ptr %local.nu.1153
  %t1234 = load i64, ptr %local.dt.1155
  %t1235 = load i64, ptr %local.dx.1154
  %t1236 = call i64 @"burgers_step_3pt"(i64 %t1230, i64 %t1231, i64 %t1232, i64 %t1233, i64 %t1234, i64 %t1235)
  store i64 %t1236, ptr %local.n3.1172
  %t1237 = load i64, ptr %local.u3.1159
  %t1238 = load i64, ptr %local.u4.1160
  %t1239 = load i64, ptr %local.u5.1161
  %t1240 = load i64, ptr %local.nu.1153
  %t1241 = load i64, ptr %local.dt.1155
  %t1242 = load i64, ptr %local.dx.1154
  %t1243 = call i64 @"burgers_step_3pt"(i64 %t1237, i64 %t1238, i64 %t1239, i64 %t1240, i64 %t1241, i64 %t1242)
  store i64 %t1243, ptr %local.n4.1173
  %t1244 = load i64, ptr %local.u4.1160
  %t1245 = load i64, ptr %local.u5.1161
  %t1246 = load i64, ptr %local.u6.1162
  %t1247 = load i64, ptr %local.nu.1153
  %t1248 = load i64, ptr %local.dt.1155
  %t1249 = load i64, ptr %local.dx.1154
  %t1250 = call i64 @"burgers_step_3pt"(i64 %t1244, i64 %t1245, i64 %t1246, i64 %t1247, i64 %t1248, i64 %t1249)
  store i64 %t1250, ptr %local.n5.1174
  %t1251 = load i64, ptr %local.u5.1161
  %t1252 = load i64, ptr %local.u6.1162
  %t1253 = load i64, ptr %local.u7.1163
  %t1254 = load i64, ptr %local.nu.1153
  %t1255 = load i64, ptr %local.dt.1155
  %t1256 = load i64, ptr %local.dx.1154
  %t1257 = call i64 @"burgers_step_3pt"(i64 %t1251, i64 %t1252, i64 %t1253, i64 %t1254, i64 %t1255, i64 %t1256)
  store i64 %t1257, ptr %local.n6.1175
  %t1258 = load i64, ptr %local.u6.1162
  %t1259 = load i64, ptr %local.u7.1163
  %t1260 = load i64, ptr %local.u8.1164
  %t1261 = load i64, ptr %local.nu.1153
  %t1262 = load i64, ptr %local.dt.1155
  %t1263 = load i64, ptr %local.dx.1154
  %t1264 = call i64 @"burgers_step_3pt"(i64 %t1258, i64 %t1259, i64 %t1260, i64 %t1261, i64 %t1262, i64 %t1263)
  store i64 %t1264, ptr %local.n7.1176
  %t1265 = load i64, ptr %local.u7.1163
  %t1266 = load i64, ptr %local.u8.1164
  %t1267 = load i64, ptr %local.u9.1165
  %t1268 = load i64, ptr %local.nu.1153
  %t1269 = load i64, ptr %local.dt.1155
  %t1270 = load i64, ptr %local.dx.1154
  %t1271 = call i64 @"burgers_step_3pt"(i64 %t1265, i64 %t1266, i64 %t1267, i64 %t1268, i64 %t1269, i64 %t1270)
  store i64 %t1271, ptr %local.n8.1177
  %t1272 = load i64, ptr %local.u8.1164
  %t1273 = load i64, ptr %local.u9.1165
  %t1274 = load i64, ptr %local.u0.1156
  %t1275 = load i64, ptr %local.nu.1153
  %t1276 = load i64, ptr %local.dt.1155
  %t1277 = load i64, ptr %local.dx.1154
  %t1278 = call i64 @"burgers_step_3pt"(i64 %t1272, i64 %t1273, i64 %t1274, i64 %t1275, i64 %t1276, i64 %t1277)
  store i64 %t1278, ptr %local.n9.1178
  %t1279 = load i64, ptr %local.n0.1169
  %t1280 = call i64 @"clamp_f64"(i64 %t1279)
  store i64 %t1280, ptr %local.u0.1156
  %t1281 = load i64, ptr %local.n1.1170
  %t1282 = call i64 @"clamp_f64"(i64 %t1281)
  store i64 %t1282, ptr %local.u1.1157
  %t1283 = load i64, ptr %local.n2.1171
  %t1284 = call i64 @"clamp_f64"(i64 %t1283)
  store i64 %t1284, ptr %local.u2.1158
  %t1285 = load i64, ptr %local.n3.1172
  %t1286 = call i64 @"clamp_f64"(i64 %t1285)
  store i64 %t1286, ptr %local.u3.1159
  %t1287 = load i64, ptr %local.n4.1173
  %t1288 = call i64 @"clamp_f64"(i64 %t1287)
  store i64 %t1288, ptr %local.u4.1160
  %t1289 = load i64, ptr %local.n5.1174
  %t1290 = call i64 @"clamp_f64"(i64 %t1289)
  store i64 %t1290, ptr %local.u5.1161
  %t1291 = load i64, ptr %local.n6.1175
  %t1292 = call i64 @"clamp_f64"(i64 %t1291)
  store i64 %t1292, ptr %local.u6.1162
  %t1293 = load i64, ptr %local.n7.1176
  %t1294 = call i64 @"clamp_f64"(i64 %t1293)
  store i64 %t1294, ptr %local.u7.1163
  %t1295 = load i64, ptr %local.n8.1177
  %t1296 = call i64 @"clamp_f64"(i64 %t1295)
  store i64 %t1296, ptr %local.u8.1164
  %t1297 = load i64, ptr %local.n9.1178
  %t1298 = call i64 @"clamp_f64"(i64 %t1297)
  store i64 %t1298, ptr %local.u9.1165
  %t1299 = load i64, ptr %local.u0.1156
  %t1300 = load i64, ptr %local.u1.1157
  %t1301 = load i64, ptr %local.u2.1158
  %t1302 = load i64, ptr %local.u3.1159
  %t1303 = load i64, ptr %local.u4.1160
  %t1304 = load i64, ptr %local.u5.1161
  %t1305 = load i64, ptr %local.u6.1162
  %t1306 = load i64, ptr %local.u7.1163
  %t1307 = load i64, ptr %local.u8.1164
  %t1308 = load i64, ptr %local.u9.1165
  %t1309 = load i64, ptr %local.dx.1154
  %t1310 = call i64 @"max_grad_10pt"(i64 %t1299, i64 %t1300, i64 %t1301, i64 %t1302, i64 %t1303, i64 %t1304, i64 %t1305, i64 %t1306, i64 %t1307, i64 %t1308, i64 %t1309)
  store i64 %t1310, ptr %local.mg.1179
  %t1311 = load i64, ptr %local.bkm.1167
  %t1312 = load i64, ptr %local.mg.1179
  %t1313 = load i64, ptr %local.dt.1155
  %t1314 = call i64 @"sx_f64_mul"(i64 %t1312, i64 %t1313)
  %t1315 = call i64 @"sx_f64_add"(i64 %t1311, i64 %t1314)
  store i64 %t1315, ptr %local.bkm.1167
  %t1316 = load i64, ptr %local.query
  %t1317 = icmp eq i64 %t1316, 0
  %t1318 = zext i1 %t1317 to i64
  %t1319 = icmp ne i64 %t1318, 0
  br i1 %t1319, label %then72, label %else72
then72:
  %t1320 = load i64, ptr %local.step.1166
  %t1321 = icmp eq i64 %t1320, 24999
  %t1322 = zext i1 %t1321 to i64
  %t1323 = icmp ne i64 %t1322, 0
  br i1 %t1323, label %then73, label %else73
then73:
  %t1324 = load i64, ptr %local.bkm.1167
  store i64 %t1324, ptr %local.result.1168
  br label %then73_end
then73_end:
  br label %endif73
else73:
  br label %else73_end
else73_end:
  br label %endif73
endif73:
  %t1325 = phi i64 [ 0, %then73_end ], [ 0, %else73_end ]
  br label %then72_end
then72_end:
  br label %endif72
else72:
  br label %else72_end
else72_end:
  br label %endif72
endif72:
  %t1326 = phi i64 [ %t1325, %then72_end ], [ 0, %else72_end ]
  %t1327 = load i64, ptr %local.query
  %t1328 = icmp eq i64 %t1327, 3
  %t1329 = zext i1 %t1328 to i64
  %t1330 = icmp ne i64 %t1329, 0
  br i1 %t1330, label %then74, label %else74
then74:
  %t1331 = load i64, ptr %local.step.1166
  %t1332 = icmp eq i64 %t1331, 999
  %t1333 = zext i1 %t1332 to i64
  %t1334 = icmp ne i64 %t1333, 0
  br i1 %t1334, label %then75, label %else75
then75:
  %t1335 = load i64, ptr %local.mg.1179
  store i64 %t1335, ptr %local.result.1168
  br label %then75_end
then75_end:
  br label %endif75
else75:
  br label %else75_end
else75_end:
  br label %endif75
endif75:
  %t1336 = phi i64 [ 0, %then75_end ], [ 0, %else75_end ]
  br label %then74_end
then74_end:
  br label %endif74
else74:
  br label %else74_end
else74_end:
  br label %endif74
endif74:
  %t1337 = phi i64 [ %t1336, %then74_end ], [ 0, %else74_end ]
  %t1338 = load i64, ptr %local.query
  %t1339 = icmp eq i64 %t1338, 4
  %t1340 = zext i1 %t1339 to i64
  %t1341 = icmp ne i64 %t1340, 0
  br i1 %t1341, label %then76, label %else76
then76:
  %t1342 = load i64, ptr %local.step.1166
  %t1343 = icmp eq i64 %t1342, 9999
  %t1344 = zext i1 %t1343 to i64
  %t1345 = icmp ne i64 %t1344, 0
  br i1 %t1345, label %then77, label %else77
then77:
  %t1346 = load i64, ptr %local.mg.1179
  store i64 %t1346, ptr %local.result.1168
  br label %then77_end
then77_end:
  br label %endif77
else77:
  br label %else77_end
else77_end:
  br label %endif77
endif77:
  %t1347 = phi i64 [ 0, %then77_end ], [ 0, %else77_end ]
  br label %then76_end
then76_end:
  br label %endif76
else76:
  br label %else76_end
else76_end:
  br label %endif76
endif76:
  %t1348 = phi i64 [ %t1347, %then76_end ], [ 0, %else76_end ]
  %t1349 = load i64, ptr %local.query
  %t1350 = icmp eq i64 %t1349, 5
  %t1351 = zext i1 %t1350 to i64
  %t1352 = icmp ne i64 %t1351, 0
  br i1 %t1352, label %then78, label %else78
then78:
  %t1353 = load i64, ptr %local.step.1166
  %t1354 = icmp eq i64 %t1353, 49999
  %t1355 = zext i1 %t1354 to i64
  %t1356 = icmp ne i64 %t1355, 0
  br i1 %t1356, label %then79, label %else79
then79:
  %t1357 = load i64, ptr %local.mg.1179
  store i64 %t1357, ptr %local.result.1168
  br label %then79_end
then79_end:
  br label %endif79
else79:
  br label %else79_end
else79_end:
  br label %endif79
endif79:
  %t1358 = phi i64 [ 0, %then79_end ], [ 0, %else79_end ]
  br label %then78_end
then78_end:
  br label %endif78
else78:
  br label %else78_end
else78_end:
  br label %endif78
endif78:
  %t1359 = phi i64 [ %t1358, %then78_end ], [ 0, %else78_end ]
  %t1360 = load i64, ptr %local.query
  %t1361 = icmp eq i64 %t1360, 6
  %t1362 = zext i1 %t1361 to i64
  %t1363 = icmp ne i64 %t1362, 0
  br i1 %t1363, label %then80, label %else80
then80:
  %t1364 = load i64, ptr %local.step.1166
  %t1365 = icmp eq i64 %t1364, 999
  %t1366 = zext i1 %t1365 to i64
  %t1367 = icmp ne i64 %t1366, 0
  br i1 %t1367, label %then81, label %else81
then81:
  %t1368 = load i64, ptr %local.bkm.1167
  store i64 %t1368, ptr %local.result.1168
  br label %then81_end
then81_end:
  br label %endif81
else81:
  br label %else81_end
else81_end:
  br label %endif81
endif81:
  %t1369 = phi i64 [ 0, %then81_end ], [ 0, %else81_end ]
  br label %then80_end
then80_end:
  br label %endif80
else80:
  br label %else80_end
else80_end:
  br label %endif80
endif80:
  %t1370 = phi i64 [ %t1369, %then80_end ], [ 0, %else80_end ]
  %t1371 = load i64, ptr %local.query
  %t1372 = icmp eq i64 %t1371, 7
  %t1373 = zext i1 %t1372 to i64
  %t1374 = icmp ne i64 %t1373, 0
  br i1 %t1374, label %then82, label %else82
then82:
  %t1375 = load i64, ptr %local.step.1166
  %t1376 = icmp eq i64 %t1375, 4999
  %t1377 = zext i1 %t1376 to i64
  %t1378 = icmp ne i64 %t1377, 0
  br i1 %t1378, label %then83, label %else83
then83:
  %t1379 = load i64, ptr %local.bkm.1167
  store i64 %t1379, ptr %local.result.1168
  br label %then83_end
then83_end:
  br label %endif83
else83:
  br label %else83_end
else83_end:
  br label %endif83
endif83:
  %t1380 = phi i64 [ 0, %then83_end ], [ 0, %else83_end ]
  br label %then82_end
then82_end:
  br label %endif82
else82:
  br label %else82_end
else82_end:
  br label %endif82
endif82:
  %t1381 = phi i64 [ %t1380, %then82_end ], [ 0, %else82_end ]
  %t1382 = load i64, ptr %local.query
  %t1383 = icmp eq i64 %t1382, 8
  %t1384 = zext i1 %t1383 to i64
  %t1385 = icmp ne i64 %t1384, 0
  br i1 %t1385, label %then84, label %else84
then84:
  %t1386 = load i64, ptr %local.step.1166
  %t1387 = icmp eq i64 %t1386, 9999
  %t1388 = zext i1 %t1387 to i64
  %t1389 = icmp ne i64 %t1388, 0
  br i1 %t1389, label %then85, label %else85
then85:
  %t1390 = load i64, ptr %local.bkm.1167
  store i64 %t1390, ptr %local.result.1168
  br label %then85_end
then85_end:
  br label %endif85
else85:
  br label %else85_end
else85_end:
  br label %endif85
endif85:
  %t1391 = phi i64 [ 0, %then85_end ], [ 0, %else85_end ]
  br label %then84_end
then84_end:
  br label %endif84
else84:
  br label %else84_end
else84_end:
  br label %endif84
endif84:
  %t1392 = phi i64 [ %t1391, %then84_end ], [ 0, %else84_end ]
  %t1393 = load i64, ptr %local.query
  %t1394 = icmp eq i64 %t1393, 9
  %t1395 = zext i1 %t1394 to i64
  %t1396 = icmp ne i64 %t1395, 0
  br i1 %t1396, label %then86, label %else86
then86:
  %t1397 = load i64, ptr %local.step.1166
  %t1398 = icmp eq i64 %t1397, 19999
  %t1399 = zext i1 %t1398 to i64
  %t1400 = icmp ne i64 %t1399, 0
  br i1 %t1400, label %then87, label %else87
then87:
  %t1401 = load i64, ptr %local.bkm.1167
  store i64 %t1401, ptr %local.result.1168
  br label %then87_end
then87_end:
  br label %endif87
else87:
  br label %else87_end
else87_end:
  br label %endif87
endif87:
  %t1402 = phi i64 [ 0, %then87_end ], [ 0, %else87_end ]
  br label %then86_end
then86_end:
  br label %endif86
else86:
  br label %else86_end
else86_end:
  br label %endif86
endif86:
  %t1403 = phi i64 [ %t1402, %then86_end ], [ 0, %else86_end ]
  %t1404 = load i64, ptr %local.query
  %t1405 = icmp eq i64 %t1404, 10
  %t1406 = zext i1 %t1405 to i64
  %t1407 = icmp ne i64 %t1406, 0
  br i1 %t1407, label %then88, label %else88
then88:
  %t1408 = load i64, ptr %local.step.1166
  %t1409 = icmp eq i64 %t1408, 29999
  %t1410 = zext i1 %t1409 to i64
  %t1411 = icmp ne i64 %t1410, 0
  br i1 %t1411, label %then89, label %else89
then89:
  %t1412 = load i64, ptr %local.bkm.1167
  store i64 %t1412, ptr %local.result.1168
  br label %then89_end
then89_end:
  br label %endif89
else89:
  br label %else89_end
else89_end:
  br label %endif89
endif89:
  %t1413 = phi i64 [ 0, %then89_end ], [ 0, %else89_end ]
  br label %then88_end
then88_end:
  br label %endif88
else88:
  br label %else88_end
else88_end:
  br label %endif88
endif88:
  %t1414 = phi i64 [ %t1413, %then88_end ], [ 0, %else88_end ]
  %t1415 = load i64, ptr %local.query
  %t1416 = icmp eq i64 %t1415, 11
  %t1417 = zext i1 %t1416 to i64
  %t1418 = icmp ne i64 %t1417, 0
  br i1 %t1418, label %then90, label %else90
then90:
  %t1419 = load i64, ptr %local.step.1166
  %t1420 = icmp eq i64 %t1419, 39999
  %t1421 = zext i1 %t1420 to i64
  %t1422 = icmp ne i64 %t1421, 0
  br i1 %t1422, label %then91, label %else91
then91:
  %t1423 = load i64, ptr %local.bkm.1167
  store i64 %t1423, ptr %local.result.1168
  br label %then91_end
then91_end:
  br label %endif91
else91:
  br label %else91_end
else91_end:
  br label %endif91
endif91:
  %t1424 = phi i64 [ 0, %then91_end ], [ 0, %else91_end ]
  br label %then90_end
then90_end:
  br label %endif90
else90:
  br label %else90_end
else90_end:
  br label %endif90
endif90:
  %t1425 = phi i64 [ %t1424, %then90_end ], [ 0, %else90_end ]
  %t1426 = load i64, ptr %local.step.1166
  %t1427 = add i64 %t1426, 1
  store i64 %t1427, ptr %local.step.1166
  br label %loop71
endloop71:
  %t1428 = load i64, ptr %local.query
  %t1429 = icmp eq i64 %t1428, 1
  %t1430 = zext i1 %t1429 to i64
  %t1431 = icmp ne i64 %t1430, 0
  br i1 %t1431, label %then92, label %else92
then92:
  %t1432 = load i64, ptr %local.bkm.1167
  ret i64 %t1432
else92:
  br label %else92_end
else92_end:
  br label %endif92
endif92:
  %t1433 = phi i64 [ 0, %else92_end ]
  %t1434 = load i64, ptr %local.query
  %t1435 = icmp eq i64 %t1434, 5
  %t1436 = zext i1 %t1435 to i64
  %t1437 = icmp ne i64 %t1436, 0
  br i1 %t1437, label %then93, label %else93
then93:
  %t1438 = load i64, ptr %local.result.1168
  ret i64 %t1438
else93:
  br label %else93_end
else93_end:
  br label %endif93
endif93:
  %t1439 = phi i64 [ 0, %else93_end ]
  %t1440 = load i64, ptr %local.result.1168
  ret i64 %t1440
}

define i64 @"exp3_final_s"() nounwind {
entry:
  %local.nu.1441 = alloca i64
  %local.dx.1442 = alloca i64
  %local.dt.1443 = alloca i64
  %local.u0.1444 = alloca i64
  %local.u1.1445 = alloca i64
  %local.u2.1446 = alloca i64
  %local.u3.1447 = alloca i64
  %local.u4.1448 = alloca i64
  %local.u5.1449 = alloca i64
  %local.u6.1450 = alloca i64
  %local.u7.1451 = alloca i64
  %local.u8.1452 = alloca i64
  %local.u9.1453 = alloca i64
  %local.step.1454 = alloca i64
  %local.win_sum.1455 = alloca i64
  %local.win_count.1456 = alloca i64
  %local.prev_win_avg.1457 = alloca i64
  %local.cur_s.1458 = alloca i64
  %local.prev_max_u.1459 = alloca i64
  %local.n0.1460 = alloca i64
  %local.n1.1461 = alloca i64
  %local.n2.1462 = alloca i64
  %local.n3.1463 = alloca i64
  %local.n4.1464 = alloca i64
  %local.n5.1465 = alloca i64
  %local.n6.1466 = alloca i64
  %local.n7.1467 = alloca i64
  %local.n8.1468 = alloca i64
  %local.n9.1469 = alloca i64
  %local.mu.1470 = alloca i64
  %local.mu2.1471 = alloca i64
  %local.cur_max.1472 = alloca i64
  %local.drift.1473 = alloca i64
  %local.wa.1474 = alloca i64
  %t1475 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.158)
  store i64 %t1475, ptr %local.nu.1441
  %t1476 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.159)
  store i64 %t1476, ptr %local.dx.1442
  %t1477 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.160)
  store i64 %t1477, ptr %local.dt.1443
  %t1478 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.161)
  %t1479 = call i64 @"u_init_steep"(i64 %t1478)
  store i64 %t1479, ptr %local.u0.1444
  %t1480 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.162)
  %t1481 = call i64 @"u_init_steep"(i64 %t1480)
  store i64 %t1481, ptr %local.u1.1445
  %t1482 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.163)
  %t1483 = call i64 @"u_init_steep"(i64 %t1482)
  store i64 %t1483, ptr %local.u2.1446
  %t1484 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.164)
  %t1485 = call i64 @"u_init_steep"(i64 %t1484)
  store i64 %t1485, ptr %local.u3.1447
  %t1486 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.165)
  %t1487 = call i64 @"u_init_steep"(i64 %t1486)
  store i64 %t1487, ptr %local.u4.1448
  %t1488 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.166)
  %t1489 = call i64 @"u_init_steep"(i64 %t1488)
  store i64 %t1489, ptr %local.u5.1449
  %t1490 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.167)
  %t1491 = call i64 @"u_init_steep"(i64 %t1490)
  store i64 %t1491, ptr %local.u6.1450
  %t1492 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.168)
  %t1493 = call i64 @"u_init_steep"(i64 %t1492)
  store i64 %t1493, ptr %local.u7.1451
  %t1494 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.169)
  %t1495 = call i64 @"u_init_steep"(i64 %t1494)
  store i64 %t1495, ptr %local.u8.1452
  %t1496 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.170)
  %t1497 = call i64 @"u_init_steep"(i64 %t1496)
  store i64 %t1497, ptr %local.u9.1453
  store i64 0, ptr %local.step.1454
  %t1498 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.171)
  store i64 %t1498, ptr %local.win_sum.1455
  store i64 0, ptr %local.win_count.1456
  %t1499 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.172)
  store i64 %t1499, ptr %local.prev_win_avg.1457
  %t1500 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.173)
  store i64 %t1500, ptr %local.cur_s.1458
  %t1501 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.174)
  store i64 %t1501, ptr %local.prev_max_u.1459
  br label %loop94
loop94:
  %t1502 = load i64, ptr %local.step.1454
  %t1503 = icmp slt i64 %t1502, 50000
  %t1504 = zext i1 %t1503 to i64
  %t1505 = icmp ne i64 %t1504, 0
  br i1 %t1505, label %body94, label %endloop94
body94:
  %t1506 = load i64, ptr %local.u9.1453
  %t1507 = load i64, ptr %local.u0.1444
  %t1508 = load i64, ptr %local.u1.1445
  %t1509 = load i64, ptr %local.nu.1441
  %t1510 = load i64, ptr %local.dt.1443
  %t1511 = load i64, ptr %local.dx.1442
  %t1512 = call i64 @"burgers_step_3pt"(i64 %t1506, i64 %t1507, i64 %t1508, i64 %t1509, i64 %t1510, i64 %t1511)
  store i64 %t1512, ptr %local.n0.1460
  %t1513 = load i64, ptr %local.u0.1444
  %t1514 = load i64, ptr %local.u1.1445
  %t1515 = load i64, ptr %local.u2.1446
  %t1516 = load i64, ptr %local.nu.1441
  %t1517 = load i64, ptr %local.dt.1443
  %t1518 = load i64, ptr %local.dx.1442
  %t1519 = call i64 @"burgers_step_3pt"(i64 %t1513, i64 %t1514, i64 %t1515, i64 %t1516, i64 %t1517, i64 %t1518)
  store i64 %t1519, ptr %local.n1.1461
  %t1520 = load i64, ptr %local.u1.1445
  %t1521 = load i64, ptr %local.u2.1446
  %t1522 = load i64, ptr %local.u3.1447
  %t1523 = load i64, ptr %local.nu.1441
  %t1524 = load i64, ptr %local.dt.1443
  %t1525 = load i64, ptr %local.dx.1442
  %t1526 = call i64 @"burgers_step_3pt"(i64 %t1520, i64 %t1521, i64 %t1522, i64 %t1523, i64 %t1524, i64 %t1525)
  store i64 %t1526, ptr %local.n2.1462
  %t1527 = load i64, ptr %local.u2.1446
  %t1528 = load i64, ptr %local.u3.1447
  %t1529 = load i64, ptr %local.u4.1448
  %t1530 = load i64, ptr %local.nu.1441
  %t1531 = load i64, ptr %local.dt.1443
  %t1532 = load i64, ptr %local.dx.1442
  %t1533 = call i64 @"burgers_step_3pt"(i64 %t1527, i64 %t1528, i64 %t1529, i64 %t1530, i64 %t1531, i64 %t1532)
  store i64 %t1533, ptr %local.n3.1463
  %t1534 = load i64, ptr %local.u3.1447
  %t1535 = load i64, ptr %local.u4.1448
  %t1536 = load i64, ptr %local.u5.1449
  %t1537 = load i64, ptr %local.nu.1441
  %t1538 = load i64, ptr %local.dt.1443
  %t1539 = load i64, ptr %local.dx.1442
  %t1540 = call i64 @"burgers_step_3pt"(i64 %t1534, i64 %t1535, i64 %t1536, i64 %t1537, i64 %t1538, i64 %t1539)
  store i64 %t1540, ptr %local.n4.1464
  %t1541 = load i64, ptr %local.u4.1448
  %t1542 = load i64, ptr %local.u5.1449
  %t1543 = load i64, ptr %local.u6.1450
  %t1544 = load i64, ptr %local.nu.1441
  %t1545 = load i64, ptr %local.dt.1443
  %t1546 = load i64, ptr %local.dx.1442
  %t1547 = call i64 @"burgers_step_3pt"(i64 %t1541, i64 %t1542, i64 %t1543, i64 %t1544, i64 %t1545, i64 %t1546)
  store i64 %t1547, ptr %local.n5.1465
  %t1548 = load i64, ptr %local.u5.1449
  %t1549 = load i64, ptr %local.u6.1450
  %t1550 = load i64, ptr %local.u7.1451
  %t1551 = load i64, ptr %local.nu.1441
  %t1552 = load i64, ptr %local.dt.1443
  %t1553 = load i64, ptr %local.dx.1442
  %t1554 = call i64 @"burgers_step_3pt"(i64 %t1548, i64 %t1549, i64 %t1550, i64 %t1551, i64 %t1552, i64 %t1553)
  store i64 %t1554, ptr %local.n6.1466
  %t1555 = load i64, ptr %local.u6.1450
  %t1556 = load i64, ptr %local.u7.1451
  %t1557 = load i64, ptr %local.u8.1452
  %t1558 = load i64, ptr %local.nu.1441
  %t1559 = load i64, ptr %local.dt.1443
  %t1560 = load i64, ptr %local.dx.1442
  %t1561 = call i64 @"burgers_step_3pt"(i64 %t1555, i64 %t1556, i64 %t1557, i64 %t1558, i64 %t1559, i64 %t1560)
  store i64 %t1561, ptr %local.n7.1467
  %t1562 = load i64, ptr %local.u7.1451
  %t1563 = load i64, ptr %local.u8.1452
  %t1564 = load i64, ptr %local.u9.1453
  %t1565 = load i64, ptr %local.nu.1441
  %t1566 = load i64, ptr %local.dt.1443
  %t1567 = load i64, ptr %local.dx.1442
  %t1568 = call i64 @"burgers_step_3pt"(i64 %t1562, i64 %t1563, i64 %t1564, i64 %t1565, i64 %t1566, i64 %t1567)
  store i64 %t1568, ptr %local.n8.1468
  %t1569 = load i64, ptr %local.u8.1452
  %t1570 = load i64, ptr %local.u9.1453
  %t1571 = load i64, ptr %local.u0.1444
  %t1572 = load i64, ptr %local.nu.1441
  %t1573 = load i64, ptr %local.dt.1443
  %t1574 = load i64, ptr %local.dx.1442
  %t1575 = call i64 @"burgers_step_3pt"(i64 %t1569, i64 %t1570, i64 %t1571, i64 %t1572, i64 %t1573, i64 %t1574)
  store i64 %t1575, ptr %local.n9.1469
  %t1576 = load i64, ptr %local.n0.1460
  %t1577 = call i64 @"clamp_f64"(i64 %t1576)
  store i64 %t1577, ptr %local.u0.1444
  %t1578 = load i64, ptr %local.n1.1461
  %t1579 = call i64 @"clamp_f64"(i64 %t1578)
  store i64 %t1579, ptr %local.u1.1445
  %t1580 = load i64, ptr %local.n2.1462
  %t1581 = call i64 @"clamp_f64"(i64 %t1580)
  store i64 %t1581, ptr %local.u2.1446
  %t1582 = load i64, ptr %local.n3.1463
  %t1583 = call i64 @"clamp_f64"(i64 %t1582)
  store i64 %t1583, ptr %local.u3.1447
  %t1584 = load i64, ptr %local.n4.1464
  %t1585 = call i64 @"clamp_f64"(i64 %t1584)
  store i64 %t1585, ptr %local.u4.1448
  %t1586 = load i64, ptr %local.n5.1465
  %t1587 = call i64 @"clamp_f64"(i64 %t1586)
  store i64 %t1587, ptr %local.u5.1449
  %t1588 = load i64, ptr %local.n6.1466
  %t1589 = call i64 @"clamp_f64"(i64 %t1588)
  store i64 %t1589, ptr %local.u6.1450
  %t1590 = load i64, ptr %local.n7.1467
  %t1591 = call i64 @"clamp_f64"(i64 %t1590)
  store i64 %t1591, ptr %local.u7.1451
  %t1592 = load i64, ptr %local.n8.1468
  %t1593 = call i64 @"clamp_f64"(i64 %t1592)
  store i64 %t1593, ptr %local.u8.1452
  %t1594 = load i64, ptr %local.n9.1469
  %t1595 = call i64 @"clamp_f64"(i64 %t1594)
  store i64 %t1595, ptr %local.u9.1453
  %t1596 = load i64, ptr %local.u0.1444
  %t1597 = call i64 @"abs_f64"(i64 %t1596)
  %t1598 = load i64, ptr %local.u1.1445
  %t1599 = call i64 @"abs_f64"(i64 %t1598)
  %t1600 = load i64, ptr %local.u2.1446
  %t1601 = call i64 @"abs_f64"(i64 %t1600)
  %t1602 = load i64, ptr %local.u3.1447
  %t1603 = call i64 @"abs_f64"(i64 %t1602)
  %t1604 = load i64, ptr %local.u4.1448
  %t1605 = call i64 @"abs_f64"(i64 %t1604)
  %t1606 = call i64 @"max5"(i64 %t1597, i64 %t1599, i64 %t1601, i64 %t1603, i64 %t1605)
  store i64 %t1606, ptr %local.mu.1470
  %t1607 = load i64, ptr %local.u5.1449
  %t1608 = call i64 @"abs_f64"(i64 %t1607)
  %t1609 = load i64, ptr %local.u6.1450
  %t1610 = call i64 @"abs_f64"(i64 %t1609)
  %t1611 = load i64, ptr %local.u7.1451
  %t1612 = call i64 @"abs_f64"(i64 %t1611)
  %t1613 = load i64, ptr %local.u8.1452
  %t1614 = call i64 @"abs_f64"(i64 %t1613)
  %t1615 = load i64, ptr %local.u9.1453
  %t1616 = call i64 @"abs_f64"(i64 %t1615)
  %t1617 = call i64 @"max5"(i64 %t1608, i64 %t1610, i64 %t1612, i64 %t1614, i64 %t1616)
  store i64 %t1617, ptr %local.mu2.1471
  %t1618 = load i64, ptr %local.mu.1470
  store i64 %t1618, ptr %local.cur_max.1472
  %t1619 = load i64, ptr %local.mu2.1471
  %t1620 = load i64, ptr %local.cur_max.1472
  %t1621 = call i64 @"sx_f64_gt"(i64 %t1619, i64 %t1620)
  %t1622 = icmp ne i64 %t1621, 0
  br i1 %t1622, label %then95, label %else95
then95:
  %t1623 = load i64, ptr %local.mu2.1471
  store i64 %t1623, ptr %local.cur_max.1472
  br label %then95_end
then95_end:
  br label %endif95
else95:
  br label %else95_end
else95_end:
  br label %endif95
endif95:
  %t1624 = phi i64 [ 0, %then95_end ], [ 0, %else95_end ]
  %t1625 = load i64, ptr %local.cur_max.1472
  %t1626 = load i64, ptr %local.prev_max_u.1459
  %t1627 = call i64 @"sx_f64_sub"(i64 %t1625, i64 %t1626)
  %t1628 = call i64 @"abs_f64"(i64 %t1627)
  store i64 %t1628, ptr %local.drift.1473
  %t1629 = load i64, ptr %local.cur_max.1472
  store i64 %t1629, ptr %local.prev_max_u.1459
  %t1630 = load i64, ptr %local.win_sum.1455
  %t1631 = load i64, ptr %local.drift.1473
  %t1632 = call i64 @"sx_f64_add"(i64 %t1630, i64 %t1631)
  store i64 %t1632, ptr %local.win_sum.1455
  %t1633 = load i64, ptr %local.win_count.1456
  %t1634 = add i64 %t1633, 1
  store i64 %t1634, ptr %local.win_count.1456
  %t1635 = load i64, ptr %local.win_count.1456
  %t1636 = icmp sge i64 %t1635, 500
  %t1637 = zext i1 %t1636 to i64
  %t1638 = icmp ne i64 %t1637, 0
  br i1 %t1638, label %then96, label %else96
then96:
  %t1639 = load i64, ptr %local.win_sum.1455
  %t1640 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.175)
  %t1641 = call i64 @"sx_f64_div"(i64 %t1639, i64 %t1640)
  store i64 %t1641, ptr %local.wa.1474
  %t1642 = load i64, ptr %local.prev_win_avg.1457
  %t1643 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.176)
  %t1644 = call i64 @"sx_f64_gt"(i64 %t1642, i64 %t1643)
  %t1645 = icmp ne i64 %t1644, 0
  br i1 %t1645, label %then97, label %else97
then97:
  %t1646 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.177)
  %t1647 = load i64, ptr %local.wa.1474
  %t1648 = load i64, ptr %local.prev_win_avg.1457
  %t1649 = call i64 @"sx_f64_div"(i64 %t1647, i64 %t1648)
  %t1650 = call i64 @"sx_f64_sub"(i64 %t1646, i64 %t1649)
  store i64 %t1650, ptr %local.cur_s.1458
  br label %then97_end
then97_end:
  br label %endif97
else97:
  br label %else97_end
else97_end:
  br label %endif97
endif97:
  %t1651 = phi i64 [ 0, %then97_end ], [ 0, %else97_end ]
  %t1652 = load i64, ptr %local.wa.1474
  store i64 %t1652, ptr %local.prev_win_avg.1457
  %t1653 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.178)
  store i64 %t1653, ptr %local.win_sum.1455
  store i64 0, ptr %local.win_count.1456
  br label %then96_end
then96_end:
  br label %endif96
else96:
  br label %else96_end
else96_end:
  br label %endif96
endif96:
  %t1654 = phi i64 [ 0, %then96_end ], [ 0, %else96_end ]
  %t1655 = load i64, ptr %local.step.1454
  %t1656 = add i64 %t1655, 1
  store i64 %t1656, ptr %local.step.1454
  br label %loop94
endloop94:
  %t1657 = load i64, ptr %local.cur_s.1458
  ret i64 %t1657
}

define i64 @"exp3_bkm_proxy"() nounwind {
entry:
  %local.bkm_1k.1658 = alloca i64
  %local.mg_1k.1659 = alloca i64
  %local.bkm_5k.1660 = alloca i64
  %local.bkm_10k.1661 = alloca i64
  %local.mg_10k.1662 = alloca i64
  %local.bkm_20k.1663 = alloca i64
  %local.bkm_30k.1664 = alloca i64
  %local.bkm_40k.1665 = alloca i64
  %local.bkm_total.1666 = alloca i64
  %local.mg_50k.1667 = alloca i64
  %local.cur_s.1668 = alloca i64
  %local.bkm_first.1669 = alloca i64
  %local.bkm_second.1670 = alloca i64
  %t1671 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.179)
  %t1672 = ptrtoint ptr %t1671 to i64
  %t1673 = inttoptr i64 %t1672 to ptr
  call void @intrinsic_println(ptr %t1673)
  %t1674 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.180)
  %t1675 = ptrtoint ptr %t1674 to i64
  %t1676 = inttoptr i64 %t1675 to ptr
  call void @intrinsic_println(ptr %t1676)
  %t1677 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.181)
  %t1678 = ptrtoint ptr %t1677 to i64
  %t1679 = inttoptr i64 %t1678 to ptr
  call void @intrinsic_println(ptr %t1679)
  %t1680 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.182)
  %t1681 = ptrtoint ptr %t1680 to i64
  %t1682 = inttoptr i64 %t1681 to ptr
  call void @intrinsic_println(ptr %t1682)
  %t1683 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.183)
  %t1684 = ptrtoint ptr %t1683 to i64
  %t1685 = inttoptr i64 %t1684 to ptr
  call void @intrinsic_println(ptr %t1685)
  %t1686 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.184)
  %t1687 = ptrtoint ptr %t1686 to i64
  %t1688 = inttoptr i64 %t1687 to ptr
  call void @intrinsic_println(ptr %t1688)
  %t1689 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.185)
  %t1690 = ptrtoint ptr %t1689 to i64
  %t1691 = inttoptr i64 %t1690 to ptr
  call void @intrinsic_println(ptr %t1691)
  %t1692 = call i64 @"exp3_run"(i64 6)
  store i64 %t1692, ptr %local.bkm_1k.1658
  %t1693 = call i64 @"exp3_run"(i64 3)
  store i64 %t1693, ptr %local.mg_1k.1659
  %t1694 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.186)
  %t1695 = ptrtoint ptr %t1694 to i64
  %t1696 = inttoptr i64 %t1695 to ptr
  call void @intrinsic_print(ptr %t1696)
  %t1697 = load i64, ptr %local.bkm_1k.1658
  %t1698 = call i64 @"print_f64"(i64 %t1697)
  %t1699 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.187)
  %t1700 = ptrtoint ptr %t1699 to i64
  %t1701 = inttoptr i64 %t1700 to ptr
  call void @intrinsic_print(ptr %t1701)
  %t1702 = load i64, ptr %local.mg_1k.1659
  %t1703 = call i64 @"print_f64"(i64 %t1702)
  %t1704 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.188)
  %t1705 = ptrtoint ptr %t1704 to i64
  %t1706 = inttoptr i64 %t1705 to ptr
  call void @intrinsic_println(ptr %t1706)
  %t1707 = call i64 @"exp3_run"(i64 7)
  store i64 %t1707, ptr %local.bkm_5k.1660
  %t1708 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.189)
  %t1709 = ptrtoint ptr %t1708 to i64
  %t1710 = inttoptr i64 %t1709 to ptr
  call void @intrinsic_print(ptr %t1710)
  %t1711 = load i64, ptr %local.bkm_5k.1660
  %t1712 = call i64 @"print_f64"(i64 %t1711)
  %t1713 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.190)
  %t1714 = ptrtoint ptr %t1713 to i64
  %t1715 = inttoptr i64 %t1714 to ptr
  call void @intrinsic_println(ptr %t1715)
  %t1716 = call i64 @"exp3_run"(i64 8)
  store i64 %t1716, ptr %local.bkm_10k.1661
  %t1717 = call i64 @"exp3_run"(i64 4)
  store i64 %t1717, ptr %local.mg_10k.1662
  %t1718 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.191)
  %t1719 = ptrtoint ptr %t1718 to i64
  %t1720 = inttoptr i64 %t1719 to ptr
  call void @intrinsic_print(ptr %t1720)
  %t1721 = load i64, ptr %local.bkm_10k.1661
  %t1722 = call i64 @"print_f64"(i64 %t1721)
  %t1723 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.192)
  %t1724 = ptrtoint ptr %t1723 to i64
  %t1725 = inttoptr i64 %t1724 to ptr
  call void @intrinsic_print(ptr %t1725)
  %t1726 = load i64, ptr %local.mg_10k.1662
  %t1727 = call i64 @"print_f64"(i64 %t1726)
  %t1728 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.193)
  %t1729 = ptrtoint ptr %t1728 to i64
  %t1730 = inttoptr i64 %t1729 to ptr
  call void @intrinsic_println(ptr %t1730)
  %t1731 = call i64 @"exp3_run"(i64 9)
  store i64 %t1731, ptr %local.bkm_20k.1663
  %t1732 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.194)
  %t1733 = ptrtoint ptr %t1732 to i64
  %t1734 = inttoptr i64 %t1733 to ptr
  call void @intrinsic_print(ptr %t1734)
  %t1735 = load i64, ptr %local.bkm_20k.1663
  %t1736 = call i64 @"print_f64"(i64 %t1735)
  %t1737 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.195)
  %t1738 = ptrtoint ptr %t1737 to i64
  %t1739 = inttoptr i64 %t1738 to ptr
  call void @intrinsic_println(ptr %t1739)
  %t1740 = call i64 @"exp3_run"(i64 10)
  store i64 %t1740, ptr %local.bkm_30k.1664
  %t1741 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.196)
  %t1742 = ptrtoint ptr %t1741 to i64
  %t1743 = inttoptr i64 %t1742 to ptr
  call void @intrinsic_print(ptr %t1743)
  %t1744 = load i64, ptr %local.bkm_30k.1664
  %t1745 = call i64 @"print_f64"(i64 %t1744)
  %t1746 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.197)
  %t1747 = ptrtoint ptr %t1746 to i64
  %t1748 = inttoptr i64 %t1747 to ptr
  call void @intrinsic_println(ptr %t1748)
  %t1749 = call i64 @"exp3_run"(i64 11)
  store i64 %t1749, ptr %local.bkm_40k.1665
  %t1750 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.198)
  %t1751 = ptrtoint ptr %t1750 to i64
  %t1752 = inttoptr i64 %t1751 to ptr
  call void @intrinsic_print(ptr %t1752)
  %t1753 = load i64, ptr %local.bkm_40k.1665
  %t1754 = call i64 @"print_f64"(i64 %t1753)
  %t1755 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.199)
  %t1756 = ptrtoint ptr %t1755 to i64
  %t1757 = inttoptr i64 %t1756 to ptr
  call void @intrinsic_println(ptr %t1757)
  %t1758 = call i64 @"exp3_run"(i64 1)
  store i64 %t1758, ptr %local.bkm_total.1666
  %t1759 = call i64 @"exp3_run"(i64 5)
  store i64 %t1759, ptr %local.mg_50k.1667
  %t1760 = call i64 @"exp3_final_s"()
  store i64 %t1760, ptr %local.cur_s.1668
  %t1761 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.200)
  %t1762 = ptrtoint ptr %t1761 to i64
  %t1763 = inttoptr i64 %t1762 to ptr
  call void @intrinsic_print(ptr %t1763)
  %t1764 = load i64, ptr %local.bkm_total.1666
  %t1765 = call i64 @"print_f64"(i64 %t1764)
  %t1766 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.201)
  %t1767 = ptrtoint ptr %t1766 to i64
  %t1768 = inttoptr i64 %t1767 to ptr
  call void @intrinsic_print(ptr %t1768)
  %t1769 = load i64, ptr %local.mg_50k.1667
  %t1770 = call i64 @"print_f64"(i64 %t1769)
  %t1771 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.202)
  %t1772 = ptrtoint ptr %t1771 to i64
  %t1773 = inttoptr i64 %t1772 to ptr
  call void @intrinsic_print(ptr %t1773)
  %t1774 = load i64, ptr %local.cur_s.1668
  %t1775 = call i64 @"print_f64"(i64 %t1774)
  %t1776 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.203)
  %t1777 = ptrtoint ptr %t1776 to i64
  %t1778 = inttoptr i64 %t1777 to ptr
  call void @intrinsic_println(ptr %t1778)
  %t1779 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.204)
  %t1780 = ptrtoint ptr %t1779 to i64
  %t1781 = inttoptr i64 %t1780 to ptr
  call void @intrinsic_println(ptr %t1781)
  %t1782 = call i64 @"exp3_run"(i64 0)
  store i64 %t1782, ptr %local.bkm_first.1669
  %t1783 = load i64, ptr %local.bkm_total.1666
  %t1784 = load i64, ptr %local.bkm_first.1669
  %t1785 = call i64 @"sx_f64_sub"(i64 %t1783, i64 %t1784)
  store i64 %t1785, ptr %local.bkm_second.1670
  %t1786 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.205)
  %t1787 = ptrtoint ptr %t1786 to i64
  %t1788 = inttoptr i64 %t1787 to ptr
  call void @intrinsic_print(ptr %t1788)
  %t1789 = load i64, ptr %local.bkm_first.1669
  %t1790 = call i64 @"print_f64"(i64 %t1789)
  %t1791 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.206)
  %t1792 = ptrtoint ptr %t1791 to i64
  %t1793 = inttoptr i64 %t1792 to ptr
  call void @intrinsic_println(ptr %t1793)
  %t1794 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.207)
  %t1795 = ptrtoint ptr %t1794 to i64
  %t1796 = inttoptr i64 %t1795 to ptr
  call void @intrinsic_print(ptr %t1796)
  %t1797 = load i64, ptr %local.bkm_second.1670
  %t1798 = call i64 @"print_f64"(i64 %t1797)
  %t1799 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.208)
  %t1800 = ptrtoint ptr %t1799 to i64
  %t1801 = inttoptr i64 %t1800 to ptr
  call void @intrinsic_println(ptr %t1801)
  %t1802 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.209)
  %t1803 = ptrtoint ptr %t1802 to i64
  %t1804 = inttoptr i64 %t1803 to ptr
  call void @intrinsic_println(ptr %t1804)
  %t1805 = load i64, ptr %local.bkm_second.1670
  %t1806 = load i64, ptr %local.bkm_first.1669
  %t1807 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.210)
  %t1808 = call i64 @"sx_f64_mul"(i64 %t1806, i64 %t1807)
  %t1809 = call i64 @"sx_f64_gt"(i64 %t1805, i64 %t1808)
  %t1810 = icmp ne i64 %t1809, 0
  br i1 %t1810, label %then98, label %else98
then98:
  %t1811 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.211)
  %t1812 = ptrtoint ptr %t1811 to i64
  %t1813 = inttoptr i64 %t1812 to ptr
  call void @intrinsic_println(ptr %t1813)
  br label %then98_end
then98_end:
  br label %endif98
else98:
  %t1814 = load i64, ptr %local.bkm_second.1670
  %t1815 = load i64, ptr %local.bkm_first.1669
  %t1816 = call i64 @"sx_f64_gt"(i64 %t1814, i64 %t1815)
  %t1817 = icmp ne i64 %t1816, 0
  br i1 %t1817, label %then99, label %else99
then99:
  %t1818 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.212)
  %t1819 = ptrtoint ptr %t1818 to i64
  %t1820 = inttoptr i64 %t1819 to ptr
  call void @intrinsic_println(ptr %t1820)
  br label %then99_end
then99_end:
  br label %endif99
else99:
  %t1821 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.213)
  %t1822 = ptrtoint ptr %t1821 to i64
  %t1823 = inttoptr i64 %t1822 to ptr
  call void @intrinsic_println(ptr %t1823)
  br label %else99_end
else99_end:
  br label %endif99
endif99:
  %t1824 = phi i64 [ 0, %then99_end ], [ 0, %else99_end ]
  br label %else98_end
else98_end:
  br label %endif98
endif98:
  %t1825 = phi i64 [ 0, %then98_end ], [ %t1824, %else98_end ]
  %t1826 = load i64, ptr %local.cur_s.1668
  %t1827 = call i64 @f64_parse(ptr @.str.exp_ns_blowup.214)
  %t1828 = call i64 @"sx_f64_lt"(i64 %t1826, i64 %t1827)
  %t1829 = icmp ne i64 %t1828, 0
  br i1 %t1829, label %then100, label %else100
then100:
  %t1830 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.215)
  %t1831 = ptrtoint ptr %t1830 to i64
  %t1832 = inttoptr i64 %t1831 to ptr
  call void @intrinsic_println(ptr %t1832)
  %t1833 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.216)
  %t1834 = ptrtoint ptr %t1833 to i64
  %t1835 = inttoptr i64 %t1834 to ptr
  call void @intrinsic_println(ptr %t1835)
  br label %then100_end
then100_end:
  br label %endif100
else100:
  %t1836 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.217)
  %t1837 = ptrtoint ptr %t1836 to i64
  %t1838 = inttoptr i64 %t1837 to ptr
  call void @intrinsic_println(ptr %t1838)
  br label %else100_end
else100_end:
  br label %endif100
endif100:
  %t1839 = phi i64 [ 0, %then100_end ], [ 0, %else100_end ]
  %t1840 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.218)
  %t1841 = ptrtoint ptr %t1840 to i64
  %t1842 = inttoptr i64 %t1841 to ptr
  call void @intrinsic_println(ptr %t1842)
  %t1843 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.219)
  %t1844 = ptrtoint ptr %t1843 to i64
  %t1845 = inttoptr i64 %t1844 to ptr
  call void @intrinsic_println(ptr %t1845)
  %t1846 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.220)
  %t1847 = ptrtoint ptr %t1846 to i64
  %t1848 = inttoptr i64 %t1847 to ptr
  call void @intrinsic_println(ptr %t1848)
  %t1849 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.221)
  %t1850 = ptrtoint ptr %t1849 to i64
  %t1851 = inttoptr i64 %t1850 to ptr
  call void @intrinsic_println(ptr %t1851)
  %t1852 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.222)
  %t1853 = ptrtoint ptr %t1852 to i64
  %t1854 = inttoptr i64 %t1853 to ptr
  call void @intrinsic_println(ptr %t1854)
  %t1855 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.223)
  %t1856 = ptrtoint ptr %t1855 to i64
  %t1857 = inttoptr i64 %t1856 to ptr
  call void @intrinsic_println(ptr %t1857)
  %t1858 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.224)
  %t1859 = ptrtoint ptr %t1858 to i64
  %t1860 = inttoptr i64 %t1859 to ptr
  call void @intrinsic_println(ptr %t1860)
  %t1861 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.225)
  %t1862 = ptrtoint ptr %t1861 to i64
  %t1863 = inttoptr i64 %t1862 to ptr
  call void @intrinsic_println(ptr %t1863)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1864 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.226)
  %t1865 = ptrtoint ptr %t1864 to i64
  %t1866 = inttoptr i64 %t1865 to ptr
  call void @intrinsic_println(ptr %t1866)
  %t1867 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.227)
  %t1868 = ptrtoint ptr %t1867 to i64
  %t1869 = inttoptr i64 %t1868 to ptr
  call void @intrinsic_println(ptr %t1869)
  %t1870 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.228)
  %t1871 = ptrtoint ptr %t1870 to i64
  %t1872 = inttoptr i64 %t1871 to ptr
  call void @intrinsic_println(ptr %t1872)
  %t1873 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.229)
  %t1874 = ptrtoint ptr %t1873 to i64
  %t1875 = inttoptr i64 %t1874 to ptr
  call void @intrinsic_println(ptr %t1875)
  %t1876 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.230)
  %t1877 = ptrtoint ptr %t1876 to i64
  %t1878 = inttoptr i64 %t1877 to ptr
  call void @intrinsic_println(ptr %t1878)
  %t1879 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.231)
  %t1880 = ptrtoint ptr %t1879 to i64
  %t1881 = inttoptr i64 %t1880 to ptr
  call void @intrinsic_println(ptr %t1881)
  %t1882 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.232)
  %t1883 = ptrtoint ptr %t1882 to i64
  %t1884 = inttoptr i64 %t1883 to ptr
  call void @intrinsic_println(ptr %t1884)
  %t1885 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.233)
  %t1886 = ptrtoint ptr %t1885 to i64
  %t1887 = inttoptr i64 %t1886 to ptr
  call void @intrinsic_println(ptr %t1887)
  %t1888 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.234)
  %t1889 = ptrtoint ptr %t1888 to i64
  %t1890 = inttoptr i64 %t1889 to ptr
  call void @intrinsic_println(ptr %t1890)
  %t1891 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.235)
  %t1892 = ptrtoint ptr %t1891 to i64
  %t1893 = inttoptr i64 %t1892 to ptr
  call void @intrinsic_println(ptr %t1893)
  %t1894 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.236)
  %t1895 = ptrtoint ptr %t1894 to i64
  %t1896 = inttoptr i64 %t1895 to ptr
  call void @intrinsic_println(ptr %t1896)
  %t1897 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.237)
  %t1898 = ptrtoint ptr %t1897 to i64
  %t1899 = inttoptr i64 %t1898 to ptr
  call void @intrinsic_println(ptr %t1899)
  %t1900 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.238)
  %t1901 = ptrtoint ptr %t1900 to i64
  %t1902 = inttoptr i64 %t1901 to ptr
  call void @intrinsic_println(ptr %t1902)
  %t1903 = call i64 @"exp1_blowup_countdown"()
  %t1904 = call i64 @"exp2_smoothness_criterion"()
  %t1905 = call i64 @"exp3_bkm_proxy"()
  %t1906 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.239)
  %t1907 = ptrtoint ptr %t1906 to i64
  %t1908 = inttoptr i64 %t1907 to ptr
  call void @intrinsic_println(ptr %t1908)
  %t1909 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.240)
  %t1910 = ptrtoint ptr %t1909 to i64
  %t1911 = inttoptr i64 %t1910 to ptr
  call void @intrinsic_println(ptr %t1911)
  %t1912 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.241)
  %t1913 = ptrtoint ptr %t1912 to i64
  %t1914 = inttoptr i64 %t1913 to ptr
  call void @intrinsic_println(ptr %t1914)
  %t1915 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.242)
  %t1916 = ptrtoint ptr %t1915 to i64
  %t1917 = inttoptr i64 %t1916 to ptr
  call void @intrinsic_println(ptr %t1917)
  %t1918 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.243)
  %t1919 = ptrtoint ptr %t1918 to i64
  %t1920 = inttoptr i64 %t1919 to ptr
  call void @intrinsic_println(ptr %t1920)
  %t1921 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.244)
  %t1922 = ptrtoint ptr %t1921 to i64
  %t1923 = inttoptr i64 %t1922 to ptr
  call void @intrinsic_println(ptr %t1923)
  %t1924 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.245)
  %t1925 = ptrtoint ptr %t1924 to i64
  %t1926 = inttoptr i64 %t1925 to ptr
  call void @intrinsic_println(ptr %t1926)
  %t1927 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.246)
  %t1928 = ptrtoint ptr %t1927 to i64
  %t1929 = inttoptr i64 %t1928 to ptr
  call void @intrinsic_println(ptr %t1929)
  %t1930 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.247)
  %t1931 = ptrtoint ptr %t1930 to i64
  %t1932 = inttoptr i64 %t1931 to ptr
  call void @intrinsic_println(ptr %t1932)
  %t1933 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.248)
  %t1934 = ptrtoint ptr %t1933 to i64
  %t1935 = inttoptr i64 %t1934 to ptr
  call void @intrinsic_println(ptr %t1935)
  %t1936 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.249)
  %t1937 = ptrtoint ptr %t1936 to i64
  %t1938 = inttoptr i64 %t1937 to ptr
  call void @intrinsic_println(ptr %t1938)
  %t1939 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.250)
  %t1940 = ptrtoint ptr %t1939 to i64
  %t1941 = inttoptr i64 %t1940 to ptr
  call void @intrinsic_println(ptr %t1941)
  %t1942 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.251)
  %t1943 = ptrtoint ptr %t1942 to i64
  %t1944 = inttoptr i64 %t1943 to ptr
  call void @intrinsic_println(ptr %t1944)
  %t1945 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.252)
  %t1946 = ptrtoint ptr %t1945 to i64
  %t1947 = inttoptr i64 %t1946 to ptr
  call void @intrinsic_println(ptr %t1947)
  %t1948 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.253)
  %t1949 = ptrtoint ptr %t1948 to i64
  %t1950 = inttoptr i64 %t1949 to ptr
  call void @intrinsic_println(ptr %t1950)
  %t1951 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.254)
  %t1952 = ptrtoint ptr %t1951 to i64
  %t1953 = inttoptr i64 %t1952 to ptr
  call void @intrinsic_println(ptr %t1953)
  %t1954 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.255)
  %t1955 = ptrtoint ptr %t1954 to i64
  %t1956 = inttoptr i64 %t1955 to ptr
  call void @intrinsic_println(ptr %t1956)
  %t1957 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.256)
  %t1958 = ptrtoint ptr %t1957 to i64
  %t1959 = inttoptr i64 %t1958 to ptr
  call void @intrinsic_println(ptr %t1959)
  %t1960 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.257)
  %t1961 = ptrtoint ptr %t1960 to i64
  %t1962 = inttoptr i64 %t1961 to ptr
  call void @intrinsic_println(ptr %t1962)
  %t1963 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.258)
  %t1964 = ptrtoint ptr %t1963 to i64
  %t1965 = inttoptr i64 %t1964 to ptr
  call void @intrinsic_println(ptr %t1965)
  %t1966 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.259)
  %t1967 = ptrtoint ptr %t1966 to i64
  %t1968 = inttoptr i64 %t1967 to ptr
  call void @intrinsic_println(ptr %t1968)
  %t1969 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.260)
  %t1970 = ptrtoint ptr %t1969 to i64
  %t1971 = inttoptr i64 %t1970 to ptr
  call void @intrinsic_println(ptr %t1971)
  %t1972 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.261)
  %t1973 = ptrtoint ptr %t1972 to i64
  %t1974 = inttoptr i64 %t1973 to ptr
  call void @intrinsic_println(ptr %t1974)
  %t1975 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.262)
  %t1976 = ptrtoint ptr %t1975 to i64
  %t1977 = inttoptr i64 %t1976 to ptr
  call void @intrinsic_println(ptr %t1977)
  %t1978 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.263)
  %t1979 = ptrtoint ptr %t1978 to i64
  %t1980 = inttoptr i64 %t1979 to ptr
  call void @intrinsic_println(ptr %t1980)
  %t1981 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.264)
  %t1982 = ptrtoint ptr %t1981 to i64
  %t1983 = inttoptr i64 %t1982 to ptr
  call void @intrinsic_println(ptr %t1983)
  %t1984 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.265)
  %t1985 = ptrtoint ptr %t1984 to i64
  %t1986 = inttoptr i64 %t1985 to ptr
  call void @intrinsic_println(ptr %t1986)
  %t1987 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_blowup.266)
  %t1988 = ptrtoint ptr %t1987 to i64
  %t1989 = inttoptr i64 %t1988 to ptr
  call void @intrinsic_println(ptr %t1989)
  ret i64 0
}


; String constants
@.str.exp_ns_blowup.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.2 = private unnamed_addr constant [23 x i8] c"3.14159265358979323846\00"
@.str.exp_ns_blowup.3 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_blowup.4 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_blowup.5 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_blowup.6 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_ns_blowup.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.8 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_blowup.9 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_blowup.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.13 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.14 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.15 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.16 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.17 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.18 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_blowup.19 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_blowup.20 = private unnamed_addr constant [8 x i8] c"0.00005\00"
@.str.exp_ns_blowup.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.22 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_blowup.23 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_blowup.24 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_ns_blowup.25 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_ns_blowup.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.28 = private unnamed_addr constant [6 x i8] c"200.0\00"
@.str.exp_ns_blowup.29 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_blowup.30 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_blowup.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.33 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_ns_blowup.34 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_blowup.35 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.36 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_ns_blowup.37 = private unnamed_addr constant [33 x i8] c"--- Exp 1: Blow-up Countdown ---\00"
@.str.exp_ns_blowup.38 = private unnamed_addr constant [32 x i8] c"  nu = 0.0001 (nearly inviscid)\00"
@.str.exp_ns_blowup.39 = private unnamed_addr constant [41 x i8] c"  u(x,0) = sin(2*pi*x) + 0.5*sin(4*pi*x)\00"
@.str.exp_ns_blowup.40 = private unnamed_addr constant [51 x i8] c"  5-point stencil, dx=0.2, dt=0.00005, 50000 steps\00"
@.str.exp_ns_blowup.41 = private unnamed_addr constant [42 x i8] c"  Question: which diagnostic fires FIRST?\00"
@.str.exp_ns_blowup.42 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.43 = private unnamed_addr constant [48 x i8] c"  Detection Timeline (step number, -1 = never):\00"
@.str.exp_ns_blowup.44 = private unnamed_addr constant [50 x i8] c"  -----------------------------------------------\00"
@.str.exp_ns_blowup.45 = private unnamed_addr constant [33 x i8] c"  S < 0 first at step:          \00"
@.str.exp_ns_blowup.46 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.47 = private unnamed_addr constant [33 x i8] c"  max|du/dx| > 10 at step:      \00"
@.str.exp_ns_blowup.48 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.49 = private unnamed_addr constant [33 x i8] c"  max|du/dx| > 100 at step:     \00"
@.str.exp_ns_blowup.50 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.51 = private unnamed_addr constant [33 x i8] c"  max|u| > 2 at step:           \00"
@.str.exp_ns_blowup.52 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.53 = private unnamed_addr constant [33 x i8] c"  max|u| > 10 at step:          \00"
@.str.exp_ns_blowup.54 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.55 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.56 = private unnamed_addr constant [18 x i8] c"  Interpretation:\00"
@.str.exp_ns_blowup.57 = private unnamed_addr constant [48 x i8] c"  -> S goes negative BEFORE gradient exceeds 10\00"
@.str.exp_ns_blowup.58 = private unnamed_addr constant [46 x i8] c"  -> S provides ADVANCE WARNING of steepening\00"
@.str.exp_ns_blowup.59 = private unnamed_addr constant [46 x i8] c"  -> Gradient exceeds 10 before or with S < 0\00"
@.str.exp_ns_blowup.60 = private unnamed_addr constant [52 x i8] c"  -> Both diagnostics detect trouble near same time\00"
@.str.exp_ns_blowup.61 = private unnamed_addr constant [42 x i8] c"  -> S goes negative BEFORE |u| exceeds 2\00"
@.str.exp_ns_blowup.62 = private unnamed_addr constant [50 x i8] c"  -> S detects instability before amplitude grows\00"
@.str.exp_ns_blowup.63 = private unnamed_addr constant [53 x i8] c"  -> S stayed non-negative: solution remained stable\00"
@.str.exp_ns_blowup.64 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.65 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_blowup.66 = private unnamed_addr constant [8 x i8] c"0.00005\00"
@.str.exp_ns_blowup.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.68 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_blowup.69 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_blowup.70 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_ns_blowup.71 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_ns_blowup.72 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.74 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.75 = private unnamed_addr constant [6 x i8] c"200.0\00"
@.str.exp_ns_blowup.76 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_blowup.77 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_blowup.78 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.79 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.80 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_blowup.81 = private unnamed_addr constant [60 x i8] c"--- Exp 2: Smoothness Criterion (2x2 Contingency Table) ---\00"
@.str.exp_ns_blowup.82 = private unnamed_addr constant [44 x i8] c"  100 trials with varying nu and amplitude.\00"
@.str.exp_ns_blowup.83 = private unnamed_addr constant [52 x i8] c"  nu from 0.0001 to 0.05, amplitude from 0.5 to 3.0\00"
@.str.exp_ns_blowup.84 = private unnamed_addr constant [33 x i8] c"  Blow-up threshold: max|u| > 50\00"
@.str.exp_ns_blowup.85 = private unnamed_addr constant [36 x i8] c"  10000 steps per trial, dt=0.00005\00"
@.str.exp_ns_blowup.86 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.88 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_blowup.89 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_ns_blowup.90 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_blowup.91 = private unnamed_addr constant [6 x i8] c"0.002\00"
@.str.exp_ns_blowup.92 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_blowup.93 = private unnamed_addr constant [6 x i8] c"0.008\00"
@.str.exp_ns_blowup.94 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_blowup.95 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_ns_blowup.96 = private unnamed_addr constant [5 x i8] c"0.03\00"
@.str.exp_ns_blowup.97 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_blowup.98 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.99 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_blowup.100 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_ns_blowup.101 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_blowup.102 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_blowup.103 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_ns_blowup.104 = private unnamed_addr constant [4 x i8] c"1.8\00"
@.str.exp_ns_blowup.105 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.106 = private unnamed_addr constant [4 x i8] c"2.3\00"
@.str.exp_ns_blowup.107 = private unnamed_addr constant [4 x i8] c"2.6\00"
@.str.exp_ns_blowup.108 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ns_blowup.109 = private unnamed_addr constant [34 x i8] c"  Contingency Table (100 trials):\00"
@.str.exp_ns_blowup.110 = private unnamed_addr constant [58 x i8] c"  -------------------------------------------------------\00"
@.str.exp_ns_blowup.111 = private unnamed_addr constant [56 x i8] c"                    |  S >= 0 always  |  S < 0 sometime\00"
@.str.exp_ns_blowup.112 = private unnamed_addr constant [58 x i8] c"  -------------------------------------------------------\00"
@.str.exp_ns_blowup.113 = private unnamed_addr constant [29 x i8] c"  Smooth (bounded)  |       \00"
@.str.exp_ns_blowup.114 = private unnamed_addr constant [19 x i8] c"          |       \00"
@.str.exp_ns_blowup.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.116 = private unnamed_addr constant [29 x i8] c"  Blow-up (unbnd)   |       \00"
@.str.exp_ns_blowup.117 = private unnamed_addr constant [19 x i8] c"          |       \00"
@.str.exp_ns_blowup.118 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.119 = private unnamed_addr constant [58 x i8] c"  -------------------------------------------------------\00"
@.str.exp_ns_blowup.120 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.121 = private unnamed_addr constant [17 x i8] c"  Total trials: \00"
@.str.exp_ns_blowup.122 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.123 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.124 = private unnamed_addr constant [67 x i8] c"  RESULT: C = 0 => S >= 0 is a NECESSARY condition for smoothness.\00"
@.str.exp_ns_blowup.125 = private unnamed_addr constant [46 x i8] c"  Every blow-up case had S < 0 at some point.\00"
@.str.exp_ns_blowup.126 = private unnamed_addr constant [55 x i8] c"  RESULT: C > 0 => Some blow-ups occurred with S >= 0.\00"
@.str.exp_ns_blowup.127 = private unnamed_addr constant [57 x i8] c"  S >= 0 is not strictly necessary (at this resolution).\00"
@.str.exp_ns_blowup.128 = private unnamed_addr constant [64 x i8] c"  RESULT: B = 0 => S < 0 is a SUFFICIENT condition for blow-up.\00"
@.str.exp_ns_blowup.129 = private unnamed_addr constant [44 x i8] c"  Every S < 0 case led to unbounded growth.\00"
@.str.exp_ns_blowup.130 = private unnamed_addr constant [54 x i8] c"  RESULT: B > 0 => Some S < 0 cases remained bounded.\00"
@.str.exp_ns_blowup.131 = private unnamed_addr constant [63 x i8] c"  S < 0 is not sufficient for blow-up (viscosity can recover).\00"
@.str.exp_ns_blowup.132 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.133 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.134 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.135 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.136 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.137 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.138 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.139 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.140 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.141 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.142 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_blowup.143 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_ns_blowup.144 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_blowup.145 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_blowup.146 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.147 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_blowup.148 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_blowup.149 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_blowup.150 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_blowup.151 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_blowup.152 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_ns_blowup.153 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_blowup.154 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_ns_blowup.155 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_blowup.156 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.157 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.158 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_ns_blowup.159 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_blowup.160 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_blowup.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.162 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_blowup.163 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_blowup.164 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_blowup.165 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_blowup.166 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_blowup.167 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_ns_blowup.168 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_blowup.169 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_ns_blowup.170 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_blowup.171 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.172 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.173 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_blowup.174 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.175 = private unnamed_addr constant [6 x i8] c"500.0\00"
@.str.exp_ns_blowup.176 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_blowup.177 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_blowup.178 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.179 = private unnamed_addr constant [49 x i8] c"--- Exp 3: S as Beale-Kato-Majda (BKM) Proxy ---\00"
@.str.exp_ns_blowup.180 = private unnamed_addr constant [67 x i8] c"  BKM theorem: blow-up at T => integral_0^T ||omega||_inf dt = inf\00"
@.str.exp_ns_blowup.181 = private unnamed_addr constant [62 x i8] c"  In 1D: omega ~ du/dx. Track running integral of max|du/dx|.\00"
@.str.exp_ns_blowup.182 = private unnamed_addr constant [53 x i8] c"  10 grid points, nu=0.0005, dt=0.0001, 50000 steps.\00"
@.str.exp_ns_blowup.183 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.184 = private unnamed_addr constant [54 x i8] c"  step      time      BKM_int     max|du/dx|  S_local\00"
@.str.exp_ns_blowup.185 = private unnamed_addr constant [55 x i8] c"  ------    ------    --------    ----------  --------\00"
@.str.exp_ns_blowup.186 = private unnamed_addr constant [23 x i8] c"  1000      0.1       \00"
@.str.exp_ns_blowup.187 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_blowup.188 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.189 = private unnamed_addr constant [23 x i8] c"  5000      0.5       \00"
@.str.exp_ns_blowup.190 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.191 = private unnamed_addr constant [23 x i8] c"  10000     1.0       \00"
@.str.exp_ns_blowup.192 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_blowup.193 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.194 = private unnamed_addr constant [23 x i8] c"  20000     2.0       \00"
@.str.exp_ns_blowup.195 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.196 = private unnamed_addr constant [23 x i8] c"  30000     3.0       \00"
@.str.exp_ns_blowup.197 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.198 = private unnamed_addr constant [23 x i8] c"  40000     4.0       \00"
@.str.exp_ns_blowup.199 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.200 = private unnamed_addr constant [23 x i8] c"  50000     5.0       \00"
@.str.exp_ns_blowup.201 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_blowup.202 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_blowup.203 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.204 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.205 = private unnamed_addr constant [47 x i8] c"  BKM integral first half (steps 0-25000):    \00"
@.str.exp_ns_blowup.206 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.207 = private unnamed_addr constant [49 x i8] c"  BKM integral second half (steps 25000-50000): \00"
@.str.exp_ns_blowup.208 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.209 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.210 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_ns_blowup.211 = private unnamed_addr constant [68 x i8] c"  BKM integral ACCELERATING — consistent with blow-up trajectory.\00"
@.str.exp_ns_blowup.212 = private unnamed_addr constant [53 x i8] c"  BKM integral growing but not accelerating sharply.\00"
@.str.exp_ns_blowup.213 = private unnamed_addr constant [71 x i8] c"  BKM integral decelerating — solution stabilising (diffusion wins).\00"
@.str.exp_ns_blowup.214 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_blowup.215 = private unnamed_addr constant [40 x i8] c"  Final S < 0 — instability detected.\00"
@.str.exp_ns_blowup.216 = private unnamed_addr constant [45 x i8] c"  S < 0 CORRELATES with BKM integral growth.\00"
@.str.exp_ns_blowup.217 = private unnamed_addr constant [40 x i8] c"  Final S >= 0 — solution converging.\00"
@.str.exp_ns_blowup.218 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.219 = private unnamed_addr constant [64 x i8] c"  CAVEAT: In 1D Burgers, shocks form (discontinuities in du/dx)\00"
@.str.exp_ns_blowup.220 = private unnamed_addr constant [68 x i8] c"  but u itself stays bounded (Cole-Hopf transform guarantees this).\00"
@.str.exp_ns_blowup.221 = private unnamed_addr constant [67 x i8] c"  The BKM integral grows due to shock formation, not true blow-up.\00"
@.str.exp_ns_blowup.222 = private unnamed_addr constant [66 x i8] c"  In 3D Navier-Stokes, vortex stretching could cause true blow-up\00"
@.str.exp_ns_blowup.223 = private unnamed_addr constant [65 x i8] c"  where ||u|| -> infinity. The S diagnostic pattern would be the\00"
@.str.exp_ns_blowup.224 = private unnamed_addr constant [70 x i8] c"  same: S < 0 signals that nonlinear steepening overwhelms diffusion.\00"
@.str.exp_ns_blowup.225 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.226 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_blowup.227 = private unnamed_addr constant [24 x i8] c"  NS BLOW-UP EXPERIMENT\00"
@.str.exp_ns_blowup.228 = private unnamed_addr constant [44 x i8] c"  Can ||u|| become infinite in finite time?\00"
@.str.exp_ns_blowup.229 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_blowup.230 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.231 = private unnamed_addr constant [37 x i8] c"  Model: 1D viscous Burgers equation\00"
@.str.exp_ns_blowup.232 = private unnamed_addr constant [35 x i8] c"    du/dt + u*du/dx = nu * d2u/dx2\00"
@.str.exp_ns_blowup.233 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.234 = private unnamed_addr constant [58 x i8] c"  CAVEAT: 1D Burgers forms shocks (du/dx discontinuities)\00"
@.str.exp_ns_blowup.235 = private unnamed_addr constant [55 x i8] c"  not smooth blow-up. In 3D NS the mechanism is vortex\00"
@.str.exp_ns_blowup.236 = private unnamed_addr constant [58 x i8] c"  stretching. We test diagnostic behaviour on steepening,\00"
@.str.exp_ns_blowup.237 = private unnamed_addr constant [39 x i8] c"  which is analogous in both settings.\00"
@.str.exp_ns_blowup.238 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.239 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_blowup.240 = private unnamed_addr constant [15 x i8] c"  CONCLUSIONS:\00"
@.str.exp_ns_blowup.241 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.242 = private unnamed_addr constant [61 x i8] c"  1. BLOW-UP COUNTDOWN: S goes negative before max|u| grows,\00"
@.str.exp_ns_blowup.243 = private unnamed_addr constant [60 x i8] c"     providing advance warning of instability. The gradient\00"
@.str.exp_ns_blowup.244 = private unnamed_addr constant [60 x i8] c"     max|du/dx| steepens first (pre-shock), then u follows.\00"
@.str.exp_ns_blowup.245 = private unnamed_addr constant [58 x i8] c"     S detects the drift acceleration that precedes both.\00"
@.str.exp_ns_blowup.246 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.247 = private unnamed_addr constant [63 x i8] c"  2. SMOOTHNESS CRITERION: The contingency table tests whether\00"
@.str.exp_ns_blowup.248 = private unnamed_addr constant [57 x i8] c"     S >= 0 is necessary for bounded solutions. If C = 0\00"
@.str.exp_ns_blowup.249 = private unnamed_addr constant [59 x i8] c"     (no blow-up with S >= 0 throughout), then S >= 0 is a\00"
@.str.exp_ns_blowup.250 = private unnamed_addr constant [61 x i8] c"     necessary condition for regularity — analogous to the\00"
@.str.exp_ns_blowup.251 = private unnamed_addr constant [33 x i8] c"     open NS millennium problem.\00"
@.str.exp_ns_blowup.252 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.253 = private unnamed_addr constant [60 x i8] c"  3. BKM PROXY: The Beale-Kato-Majda integral of max|omega|\00"
@.str.exp_ns_blowup.254 = private unnamed_addr constant [61 x i8] c"     diverges at blow-up. S < 0 correlates with BKM integral\00"
@.str.exp_ns_blowup.255 = private unnamed_addr constant [59 x i8] c"     acceleration, suggesting S tracks the same underlying\00"
@.str.exp_ns_blowup.256 = private unnamed_addr constant [55 x i8] c"     mechanism: nonlinear term overwhelming diffusion.\00"
@.str.exp_ns_blowup.257 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_blowup.258 = private unnamed_addr constant [39 x i8] c"  CONNECTION TO NS MILLENNIUM PROBLEM:\00"
@.str.exp_ns_blowup.259 = private unnamed_addr constant [60 x i8] c"  The open question is whether 3D NS smooth solutions exist\00"
@.str.exp_ns_blowup.260 = private unnamed_addr constant [60 x i8] c"  for all time. Our S diagnostic detects when the nonlinear\00"
@.str.exp_ns_blowup.261 = private unnamed_addr constant [62 x i8] c"  advection term begins to dominate diffusion — exactly the\00"
@.str.exp_ns_blowup.262 = private unnamed_addr constant [55 x i8] c"  condition that would lead to blow-up if it persists.\00"
@.str.exp_ns_blowup.263 = private unnamed_addr constant [57 x i8] c"  S >= 0 as a regularity criterion is a computable proxy\00"
@.str.exp_ns_blowup.264 = private unnamed_addr constant [58 x i8] c"  for the analytical smoothness conditions studied in the\00"
@.str.exp_ns_blowup.265 = private unnamed_addr constant [22 x i8] c"  millennium problem.\00"
@.str.exp_ns_blowup.266 = private unnamed_addr constant [61 x i8] c"============================================================\00"
